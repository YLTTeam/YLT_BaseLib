//
//  NSArray+YLT_Log.m
//  YLT_BaseLib
//
//  Created by 项普华 on 2018/4/9.
//

#import "NSArray+YLT_Log.h"

@implementation NSArray (YLT_Log)
#ifdef DEBUG
- (NSString *)descriptionWithLocale:(id)locale {
    return self.debugDescription;
}

/**
 改写数组的日志打印
 
 @param locale 本地化
 @return 打印的字串
 */
- (NSString *)descriptionWithLocale:(id)locale indent:(NSUInteger)level {
    return self.debugDescription;
}

- (NSString *)debugDescription {
    NSError *error = nil;
    //字典转成json
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:self options:NSJSONWritingPrettyPrinted  error:&error];
    //如果报错了就按原先的格式输出
    if (error) {
        return [super debugDescription];
    }
    NSString *jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    return jsonString;
}
#endif
@end
