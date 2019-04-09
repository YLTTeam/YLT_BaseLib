//
//  UIApplication+YLT_Extension.m
//  YLT_BaseLib
//
//  Created by 項普華 on 2019/4/9.
//

#import "UIApplication+YLT_Extension.h"

@implementation UIApplication (YLT_Extension)

/**
 是否是主队列
 
 @return 注意区分主队列与主线程
 */
+ (BOOL)ylt_isMainQueue {
    static void *mainQueueKey = &mainQueueKey;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        dispatch_queue_set_specific(dispatch_get_main_queue(),
                                    mainQueueKey, mainQueueKey, NULL);
    });
    
    return dispatch_get_specific(mainQueueKey) == mainQueueKey;
}

@end
