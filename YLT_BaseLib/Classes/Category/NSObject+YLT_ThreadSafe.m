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

#define YLT_SAFE_HOOK_SET_PRE @"ylt_propertySetThreadSafeHook_"
#define YLT_SAFE_HOOK_GET_PRE @"ylt_propertyGetThreadSafeHook_"

@implementation NSObject (YLT_ThreadSafe)

static dispatch_queue_t initQueue;
static void* initQueueKey;
static void* initQueueContext;

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        ylt_swizzleClassMethod(self, @selector(resolveInstanceMethod:), @selector(ylt_resolveInstanceMethod:));
    });
}

+ (void)ylt_addToSafeThread {
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
        //HOOK SETTER
        NSString *setterName = [NSString stringWithFormat:@"set%@%@:", [propertyName substringToIndex:1].uppercaseString, [propertyName substringFromIndex:1]];
        NSString *hookSetterName = [NSString stringWithFormat:@"%@%@", YLT_SAFE_HOOK_SET_PRE, setterName];
        SEL originSetter = NSSelectorFromString(setterName);
        SEL newSetter = NSSelectorFromString(hookSetterName);
        ylt_swizzleInstanceMethod(self, originSetter, newSetter);
        
        //HOOK GETTER
        NSString *getterName = [NSString stringWithFormat:@"%@", propertyName];
        NSString *hookGetterName = [NSString stringWithFormat:@"%@%@", YLT_SAFE_HOOK_GET_PRE, getterName];
        SEL originGetter = NSSelectorFromString(getterName);
        SEL newGetter = NSSelectorFromString(hookGetterName);
        ylt_swizzleInstanceMethod(self, originGetter, newGetter);
    }
}

+ (BOOL)ylt_resolveInstanceMethod:(SEL)sel {
    NSString *selName = NSStringFromSelector(sel);
    if ([selName hasPrefix:YLT_SAFE_HOOK_SET_PRE]) {
        SEL originSel = NSSelectorFromString([selName substringFromIndex:YLT_SAFE_HOOK_SET_PRE.length]);
        Method originMethod = class_getInstanceMethod(self, originSel);
        /// 对数据类型做判断处理
        // 获取方法里的输入参数
        unsigned int argCount = method_getNumberOfArguments(originMethod);
        if (argCount == 3) {
            char argName[512] = {};
            method_getArgumentType(originMethod, 2, argName, 512);
            Method proxyMethod;
            BOOL isObj = YES;
            if (strcmp(argName, @encode(NSInteger)) == 0) {
                isObj = NO;
                proxyMethod = class_getClassMethod(self, @selector(hook_setter_proxy_NSInteger:));
            }
            if (strcmp(argName, @encode(BOOL)) == 0) {
                isObj = NO;
                proxyMethod = class_getClassMethod(self, @selector(hook_setter_proxy_BOOL:));
            }
            
            if (strcmp(argName, @encode(CGFloat)) == 0) {
                isObj = NO;
                proxyMethod = class_getClassMethod(self, @selector(hook_setter_proxy_CGFloat:));
            }
            
            if (strcmp(argName, @encode(NSUInteger)) == 0) {
                isObj = NO;
                proxyMethod = class_getClassMethod(self, @selector(hook_setter_proxy_NSUInteger:));
            }
            
            if (strcmp(argName, @encode(char)) == 0) {
                isObj = NO;
                proxyMethod = class_getClassMethod(self, @selector(hook_setter_proxy_char:));
            }
            
            if (strcmp(argName, @encode(int)) == 0) {
                isObj = NO;
                proxyMethod = class_getClassMethod(self, @selector(hook_setter_proxy_int:));
            }
            if (strcmp(argName, @encode(float)) == 0) {
                isObj = NO;
                proxyMethod = class_getClassMethod(self, @selector(hook_setter_proxy_float:));
            }
            if (strcmp(argName, @encode(double)) == 0) {
                isObj = NO;
                proxyMethod = class_getClassMethod(self, @selector(hook_setter_proxy_double:));
            }
            if (strcmp(argName, @encode(Boolean)) == 0) {
                isObj = NO;
                proxyMethod = class_getClassMethod(self, @selector(hook_setter_proxy_Boolean:));
            }
            
            memset(argName, '\0', strlen(argName));
            if (isObj) {
                proxyMethod = class_getClassMethod(self, @selector(hook_setter_proxy:));
            }
            class_addMethod(self, sel, method_getImplementation(proxyMethod), method_getTypeEncoding(proxyMethod));
            return YES;
        }
    }
    if ([selName hasPrefix:YLT_SAFE_HOOK_GET_PRE]) {
        Method proxyMethod = class_getClassMethod(self, @selector(hook_getter_proxy));
        class_addMethod(self, sel, method_getImplementation(proxyMethod), method_getTypeEncoding(proxyMethod));
        return YES;
    }
    return [self ylt_resolveInstanceMethod:sel];
}

- (void)hook_setter_proxyObject:(NSObject *)proxyObject originSelector:(NSString *)originSelector {
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

- (id)hook_getter_proxy {
    // 只是实现被换了，但是selector还是没变
    NSString *originSelector = NSStringFromSelector(_cmd);
    NSString *ivarName = [NSString stringWithFormat:@"_%@", originSelector];
    return [self valueForKey:ivarName];
}

#pragma mark - 不同参数的HOOK
- (void)hook_setter_proxy_int:(int)proxyObject {
    NSString *originSelector = NSStringFromSelector(_cmd);
    [self hook_setter_proxyObject:@(proxyObject) originSelector:originSelector];
}

- (void)hook_setter_proxy_NSUInteger:(NSUInteger)proxyObject {
    NSString *originSelector = NSStringFromSelector(_cmd);
    [self hook_setter_proxyObject:@(proxyObject) originSelector:originSelector];
}

- (void)hook_setter_proxy_NSInteger:(NSInteger)proxyObject {
    NSString *originSelector = NSStringFromSelector(_cmd);
    [self hook_setter_proxyObject:@(proxyObject) originSelector:originSelector];
}

- (void)hook_setter_proxy_CGFloat:(CGFloat)proxyObject {
    NSString *originSelector = NSStringFromSelector(_cmd);
    [self hook_setter_proxyObject:@(proxyObject) originSelector:originSelector];
}

- (void)hook_setter_proxy_float:(float)proxyObject {
    NSString *originSelector = NSStringFromSelector(_cmd);
    [self hook_setter_proxyObject:@(proxyObject) originSelector:originSelector];
}

- (void)hook_setter_proxy_double:(double)proxyObject {
    NSString *originSelector = NSStringFromSelector(_cmd);
    [self hook_setter_proxyObject:@(proxyObject) originSelector:originSelector];
}

- (void)hook_setter_proxy_BOOL:(BOOL)proxyObject {
    NSString *originSelector = NSStringFromSelector(_cmd);
    [self hook_setter_proxyObject:@(proxyObject) originSelector:originSelector];
}

- (void)hook_setter_proxy_Boolean:(Boolean)proxyObject {
    NSString *originSelector = NSStringFromSelector(_cmd);
    [self hook_setter_proxyObject:@(proxyObject) originSelector:originSelector];
}

- (void)hook_setter_proxy_char:(char)proxyObject {
    NSString *originSelector = NSStringFromSelector(_cmd);
    [self hook_setter_proxyObject:@(proxyObject) originSelector:originSelector];
}

- (void)hook_setter_proxy:(NSObject *)proxyObject {
    // 只是实现被换了，但是selector还是没变
    NSString *originSelector = NSStringFromSelector(_cmd);
    [self hook_setter_proxyObject:proxyObject originSelector:originSelector];
}

@end
