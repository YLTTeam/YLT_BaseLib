//
//  YLT_DownloaderHelper.h
//  Pods
//
//  Created by YLT_Alex on 2018/1/15.
//

#import <Foundation/Foundation.h>
#import "YLT_BaseMacro.h"

@interface YLT_DownloaderHelper : NSObject

YLT_ShareInstanceHeader(YLT_DownloaderHelper);

/**
 同时支持的最大线程数量
 */
@property (nonatomic, assign) NSUInteger maxCount;

/**
 存放任务的数组
 */
@property (nonatomic, strong) NSMutableArray *tasks;

/**
 任务标记
 */
@property (nonatomic, strong) NSMutableArray *taskKeys;

/**
 添加任务

 @param task 下载任务
 @param key 标记
 */
- (void)addTask:(BOOL(^)(void))task withKey:(id)key;

@end
