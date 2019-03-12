//
//  YLT_LogHelper.h
//  FastCoding
//
//  Created by 項普華 on 2019/3/12.
//

#import <Foundation/Foundation.h>
#import "YLT_BaseModel.h"
#import "YLT_DBHelper.h"

@interface YLT_LogModel : YLT_BaseModel {
}
/** 日志ID */
@property (readwrite, nonatomic, assign) NSInteger logId;
/** 日志 */
@property (readwrite, nonatomic, strong) NSString *log;
/** 时间 yyyy-MM-dd HH:mm:ss */
@property (readwrite, nonatomic, assign) NSInteger time;

- (NSInteger)saveDB:(FMDatabase *)db;
- (BOOL)delDB:(FMDatabase *)db;
+ (BOOL)delDB:(FMDatabase *)db forConditions:(NSString *)sender;
- (BOOL)updateDB:(FMDatabase *)db;
+ (BOOL)updateDB:(FMDatabase *)db forConditions:(NSString *)sender;
+ (NSArray *)findDB:(FMDatabase *)db forConditions:(NSString *)sender;
+ (NSInteger)maxKeyValueDB:(FMDatabase *)db;

@end


@interface YLT_APILogModel : YLT_BaseModel {
}
/** 日志ID */
@property (readwrite, nonatomic, assign) NSInteger logId;
/** 请求URL */
@property (readwrite, nonatomic, strong) NSString *url;
/** 请求参数 */
@property (readwrite, nonatomic, strong) NSString *parameters;
/** 请求结果 */
@property (readwrite, nonatomic, strong) NSString *result;
/** 备注 */
@property (readwrite, nonatomic, strong) NSString *mark;
/** 时间 yyyy-MM-dd HH:mm:ss */
@property (readwrite, nonatomic, assign) NSInteger time;

- (NSInteger)saveDB:(FMDatabase *)db;
- (BOOL)delDB:(FMDatabase *)db;
+ (BOOL)delDB:(FMDatabase *)db forConditions:(NSString *)sender;
- (BOOL)updateDB:(FMDatabase *)db;
+ (BOOL)updateDB:(FMDatabase *)db forConditions:(NSString *)sender;
+ (NSArray *)findDB:(FMDatabase *)db forConditions:(NSString *)sender;
+ (NSInteger)maxKeyValueDB:(FMDatabase *)db;

@end

@interface YLT_LogHelper : NSObject

@end
