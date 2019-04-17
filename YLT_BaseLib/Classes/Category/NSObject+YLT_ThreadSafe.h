//
//  NSObject+YLT_ThreadSafe.h
//  YLT_BaseLib
//
//  Created by 項普華 on 2019/4/10.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

#define YLT_THREAD_SAFE - (void)ylt_thread_safe {}

@protocol YLT_ThreadSafeProtocol <NSObject>

+ (NSArray<NSString *> *)ylt_ignorePropertys;

@end

@interface NSObject (YLT_ThreadSafe)

+ (void)ylt_addToSafeThread;

@end

NS_ASSUME_NONNULL_END
