//
//  YLT_RouterManager.m
//  FastCoding
//
//  Created by Sean on 2018/4/28.
//

#import "YLT_RouterManager.h"
#import "YLT_BaseMacro.h"

@interface YLT_RouterManager() {
}
@end

@implementation YLT_RouterManager

/**
 路由
 
 @param routerURL 路由的URL
 @param arg 参数
 @param completion 回调
 */
+ (void)ylt_routerToURL:(NSString *)routerURL arg:(id)arg completion:(void(^)(NSError *error, id response))completion {
    NSArray *params = [self analysisURL:routerURL];
}

/**
 路由
 
 @param clsname 路由到对应的classname
 @param selname 方法名对应的字串
 @param arg 参数
 @param completion 回调
 */
+ (void)ylt_routerToClassname:(NSString *)clsname selname:(NSString *)selname arg:(id)arg completion:(void(^)(NSError *error, id response))completion {
    
}

+ (NSArray *)analysisURL:(NSString *)routerURL {
    NSMutableArray *tmpArray = [NSMutableArray array];
    NSString *regex = @"(^[A-Za-z]{4,10})://([a-zA-Z0-9_]{1,})/([a-zA-Z0-9_]{1,})[?]{0,1}([a-zA-Z0-9_=&]{0,})";
    NSError *error;
    NSRegularExpression *expression = [NSRegularExpression regularExpressionWithPattern:regex options:NSRegularExpressionCaseInsensitive error:&error];
    NSArray *matches = [expression matchesInString:routerURL options:NSMatchingReportProgress range:NSMakeRange(0, routerURL.length)];
    for (NSTextCheckingResult *match in matches) {
        NSInteger numbers = [match numberOfRanges];
        for (NSInteger i = 0; i < numbers; i ++) {
            NSString *tmpGroup = [routerURL substringWithRange:[match rangeAtIndex:i]];
            [tmpArray addObject:tmpGroup];
        }
    }
    return tmpArray;
}


@end
