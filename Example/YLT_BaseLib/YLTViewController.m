//
//  YLTViewController.m
//  YLT_BaseLib
//
//  Created by xphaijj0305@126.com on 10/25/2017.
//  Copyright (c) 2017 xphaijj0305@126.com. All rights reserved.
//

#import "YLTViewController.h"
#import <YLT_BaseLib/YLT_BaseLib.h>

@interface TestObject : YLT_BaseModel<NSCopying>

@property (nonatomic, copy) NSString *name;
@property (nonatomic, assign) Boolean age;
@property (nonatomic, assign) float age1;
@property (nonatomic, assign) double age2;
@property (nonatomic, assign) int age3;
@property (nonatomic, strong) NSMutableData *data;

@end

@implementation TestObject

YLT_THREAD_SAFE

@end

@interface YLTViewController ()

@property (nonatomic, strong) TestObject *obj;

@end

@implementation YLTViewController

YLT_THREAD_SAFE

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];
    self.obj = [[TestObject alloc] init];//[TestObject mj_objectWithKeyValues:@{@"name":@"alex"}];
    [self.obj setValue:@"alex" forKey:@"name"];
    NSLog(@"%@ %@", [NSThread currentThread], self.obj.name);
    self.obj.age1 = 12.0;
    [self.obj setValue:@12 forKey:@"age2"];
    NSLog(@"%@ %@  %f", [NSThread currentThread], self.obj.name, self.obj.age2);
}

- (void)test:(NSObject *)obj {
    NSLog(@"%@", obj);
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    for (NSInteger i = 0; i < 10000; i++) {
        dispatch_async(dispatch_get_global_queue(0, 0), ^{
            self.obj = [TestObject mj_objectWithKeyValues:@{@"name":@"alex", @"age":@12}];
//            self.obj.data = [[NSMutableData alloc] init];
//            self.obj.name = [NSString stringWithFormat:@"alex %zd", i];
        });
    }
    for (NSInteger i = 0; i < 10000; i++) {
        dispatch_async(dispatch_get_global_queue(0, 0), ^{
            NSLog(@"%@ %@", [NSThread currentThread], self.obj.name);
        });
    }
}

@end
