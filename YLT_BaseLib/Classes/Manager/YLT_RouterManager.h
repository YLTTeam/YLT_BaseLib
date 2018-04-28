//
//  YLT_RouterManager.h
//  FastCoding
//
//  Created by Sean on 2018/4/28.
//

#import <Foundation/Foundation.h>

#define YLR_ROUTER_PREFIX @"YLT_ROUTER_"

@interface YLT_RouterManager : NSObject

/**
 路由

 @param routerURL 路由的URL
 @param arg 参数
 @param completion 回调
 */
+ (void)ylt_routerToURL:(NSString *)routerURL arg:(id)arg completion:(void(^)(NSError *error, id response))completion;

/**
 路由

 @param clsname 路由到对应的classname
 @param selname 方法名对应的字串
 @param arg 参数
 @param completion 回调
 */
+ (void)ylt_routerToClassname:(NSString *)clsname selname:(NSString *)selname arg:(id)arg completion:(void(^)(NSError *error, id response))completion;

@end
