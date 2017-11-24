//
//  YLT_ModularManager.h
//  Pods
//
//  Created by YLT_Alex on 2017/11/23.
//

#import "YLT_BaseModular.h"
#import "YLT_BaseMacro.h"

@interface YLT_ModularManager : YLT_BaseModular


YLT_ShareInstanceHeader(YLT_ModularManager);

/**
 模块初始化
 
 @param plistPath 路径
 */
+ (void)modularWithPlistPath:(NSString *)plistPath;

@end
