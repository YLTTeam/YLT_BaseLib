//
//  YLTViewController.m
//  YLT_BaseLib
//
//  Created by xphaijj0305@126.com on 10/25/2017.
//  Copyright (c) 2017 xphaijj0305@126.com. All rights reserved.
//

#import "YLTViewController.h"
#import <YLT_BaseLib/YLT_BaseLib.h>

@interface YLTViewController ()

@end

@implementation YLTViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"1111");
    for (int i = 0; i < 10; i++) {
        
        dispatch_async(dispatch_get_global_queue(0, 0), ^{
            NSLog(@"%d", i);
            YLT_UnlockBlock()
        });
        
        YLT_LockBlock()
//        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2. * NSEC_PER_SEC)), dispatch_get_global_queue(0, 0), ^{
//            NSLog(@"111222 %d", i);
//            YLT_UnlockBlock();
//        });
//
//        YLT_LockBlock()
        
    }
     NSLog(@"33333");
    
    
    
    //ylt://HKAuthResultController/selname?status=认证失败&backTitle=返回修改&message=请核实您的姓名与身份证号是否匹配&success=true
//    [YLT_RouterManager ylt_routerToURL:@"ylt://HKAuthResultController/selname?status=状态&success=true" arg:@{@"key":@"value"} completion:^(NSError *error, id response) {
//        YLT_LogError(@"%@", response);
//    }];
    
//    id data = [YLT_RouterManager ylt_routerToURL:@"ylt://RouterA/shareInstance.ylt_router:?username=alex&password=123456" isClassMethod:YES arg:@{@"key":@"value"} completion:^(NSError *error, id response) {
//        YLT_Log(@"%@", response);
//    }];
//    YLT_Log(@"%@", data);

    id data = [self ylt_routerToURL:@"ylt://self/test:?username=alex&password=123456" isClassMethod:YES arg:@{@"key":@"value"} completion:^(NSError *error, id response) {
        YLT_Log(@"%@", response);
    }];
    YLT_Log(@"%@  %@", self, data);
}

- (NSString *)test:(NSDictionary *)data {
    YLT_Log(@"%@  %@", self, data);
    return @"result";
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
