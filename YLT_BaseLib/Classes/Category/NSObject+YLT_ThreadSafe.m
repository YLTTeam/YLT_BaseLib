//
//  NSObject+YLT_ThreadSafe.m
//  YLT_BaseLib
//
//  Created by 項普華 on 2019/4/10.
//

#import "NSObject+YLT_ThreadSafe.h"
#import <objc/message.h>
#import "NSObject+YLT_Extension.h"
#import "UIApplication+YLT_Extension.h"

#define YLT_SAFE_HOOK_PRE @"ylt_propertyThreadSafeHook_"

@implementation NSObject (YLT_ThreadSafe)

static dispatch_queue_t initQueue;
static void* initQueueKey;
static void* initQueueContext;

+ (void)ylt_addToSafeThread {
    static dispatch_once_t ylt_onceToken;
    dispatch_once(&ylt_onceToken, ^{
        //交换方法，确保hook的方法可以直接拦截到
        ylt_swizzleClassMethod(self, @selector(resolveInstanceMethod:), @selector(ylt_resolveInstanceMethod:));
        
        if ([UIApplication ylt_isMainQueue]) {
            initQueue = dispatch_get_main_queue();
            initQueueKey = [UIApplication ylt_mainQueueKey];
            initQueueContext = [UIApplication ylt_mainQueueContext];
        } else {
            const char *label = [[NSString stringWithFormat:@"%@_%@", NSStringFromClass(self.class), NSStringFromSelector(_cmd)] UTF8String];
            initQueueKey = &initQueueKey;
            initQueueContext = &initQueueContext;
            initQueue = dispatch_queue_create(label, nil);
            dispatch_queue_set_specific(initQueue, initQueueKey, initQueueContext, nil);
        }
    });
    [self hookAllPropertiesSetter];
}

+ (void)hookAllPropertiesSetter {
    NSDictionary *ignorePropertys;
    if ([self conformsToProtocol:@protocol(YLT_ThreadSafeProtocol)]) {
        if ([self respondsToSelector:@selector(ylt_ignorePropertys)]) {
            ignorePropertys = [self performSelector:@selector(ylt_ignorePropertys)];
        }
    }
    
    unsigned int outCount;
    objc_property_t *properties = class_copyPropertyList(self, &outCount);
    
    NSMutableArray *readWriteProperties = [[NSMutableArray alloc] initWithCapacity:outCount];
    for (unsigned int i = 0; i < outCount; i++) {
        objc_property_t property = properties[i];
        NSString *propertyName = [[NSString alloc] initWithCString:property_getName(property) encoding:NSUTF8StringEncoding];
        
        unsigned int attrCount;
        objc_property_attribute_t *attrs = property_copyAttributeList(property, &attrCount);
        // !!!!!!!!!!!!!!!!!!特别注意!!!!!!!!!!!!!!!!!!
        BOOL isReadOnlyProperty = NO;
        for (unsigned int j = 0; j < attrCount; j++) {
            if (attrs[j].name[0] == 'R') {
                isReadOnlyProperty = YES;
                break;
            }
        }
        free(attrs);
        
        if (!isReadOnlyProperty) {
            [readWriteProperties addObject:propertyName];
        }
    }
    free(properties);
    
    for (NSString *propertyName in readWriteProperties) {
        NSString *setterName = [NSString stringWithFormat:@"set%@%@:", [propertyName substringToIndex:1].uppercaseString, [propertyName substringFromIndex:1]];
        // !!!!!!!!!!!!!!!!!!特别注意!!!!!!!!!!!!!!!!!!
        NSString *hookSetterName = [NSString stringWithFormat:@"%@%@:", YLT_SAFE_HOOK_PRE, setterName];
        
        SEL originSetter = NSSelectorFromString(setterName);
        SEL newSetter = NSSelectorFromString(hookSetterName);
        
        ylt_swizzleInstanceMethod(self, originSetter, newSetter);
    }
}

+ (BOOL)ylt_resolveInstanceMethod:(SEL)sel {
    NSString *selName = NSStringFromSelector(sel);
    if ([selName hasPrefix:YLT_SAFE_HOOK_PRE]) {
        Method proxyMethod = class_getClassMethod(self, @selector(hook_proxy:));
        class_addMethod(self, sel, method_getImplementation(proxyMethod), method_getTypeEncoding(proxyMethod));
        return YES;
    }
    return [self ylt_resolveInstanceMethod:sel];
}

- (void)hook_proxy:(NSObject *)proxyObject {
    // 只是实现被换了，但是selector还是没变
    NSString *originSelector = NSStringFromSelector(_cmd);
    NSString *propertyName = [[originSelector stringByTrimmingCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@":"]] stringByReplacingOccurrencesOfString:@"set" withString:@""];
    if (propertyName.length <= 0) return;
    
    NSString *ivarName = [NSString stringWithFormat:@"_%@%@", [propertyName substringToIndex:1].lowercaseString, [propertyName substringFromIndex:1]];
    if (dispatch_get_specific(initQueueKey) == initQueueContext) {
        [self setValue:proxyObject forKey:ivarName];
    } else {
        dispatch_sync(initQueue, ^{
            [self setValue:proxyObject forKey:ivarName];
        });
    }
}

@end
