//
//  YLTViewController.m
//  YLT_BaseLib
//
//  Created by xphaijj0305@126.com on 10/25/2017.
//  Copyright (c) 2017 xphaijj0305@126.com. All rights reserved.
//

#import "YLTViewController.h"
#import <YLT_BaseLib/YLT_BaseLib.h>

@interface TestSuperObject : YLT_BaseModel<NSCopying>

@property (nonatomic, copy) NSString *nameSuper;
@property (nonatomic, strong) NSMutableData *dataSuper;

@end

@implementation TestSuperObject

+ (void)initialize {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [self ylt_addToSafeThread];
    });
}

@end


@interface TestObject : TestSuperObject<NSCopying>

@property (nonatomic, copy) NSString *name;
@property (nonatomic, assign) Boolean age;
@property (nonatomic, assign) float age1;
@property (nonatomic, assign) double age2;
@property (nonatomic, assign) int age3;
@property (nonatomic, strong) NSMutableData *data;

@end

@implementation TestObject

+ (void)initialize {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [self ylt_addToSafeThread];
    });
}

@end

@interface YLTViewController ()

@property (nonatomic, strong) TestObject *obj;

@property (nonatomic, strong) TestSuperObject *objSuper;

@property (nonatomic, strong) NSMutableArray *list;

@end

@implementation YLTViewController

YLT_THREAD_SAFE

- (void)viewDidLoad {
    [super viewDidLoad];
    self.obj = [TestObject new];
    self.view.backgroundColor = [UIColor redColor];
    self.list = [[NSMutableArray alloc] init];
//    [self test];
}

- (void)test {
    for (NSInteger i = 0; i < 100; i++) {
        dispatch_async(dispatch_get_global_queue(0, 0), ^{
            self.obj = [TestObject mj_objectWithKeyValues:@{@"name":@"alex", @"age":@12}];
            self.obj.data = [[NSMutableData alloc] init];
            self.obj.name = [NSString stringWithFormat:@"alex %zd", i];
            self.obj.nameSuper = self.obj.name;
            self.obj.dataSuper = [[NSMutableData alloc] init];
            
            self.objSuper = [TestSuperObject mj_objectWithKeyValues:@{@"nameSuper":@"aaaa"}];
            self.objSuper.dataSuper = [[NSMutableData alloc] init];
        });
    }
    for (NSInteger i = 0; i < 10000; i++) {
        dispatch_async(dispatch_get_global_queue(0, 0), ^{
            NSLog(@"%@ %@  %@", [NSThread currentThread], self.obj.name, self.objSuper.nameSuper);
        });
    }
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self test];
}

@end
