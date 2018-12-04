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
//    NSString *routerURL = @"ylt://classname/ylt_router?username=alex&password=123456";
//    [YLT_RouterManager ylt_routerToURL:routerURL arg:@{@"user":@"alex"} completion:^(NSError *error, id response) {
//
//    }];
//    [[LGAlertView alertViewWithTitle:@"sdfsdf" message:nil style:LGAlertViewStyleAlert buttonTitles:nil cancelButtonTitle:@"确定" destructiveButtonTitle:nil actionHandler:nil cancelHandler:nil destructiveHandler:^(LGAlertView * _Nonnull alertView) {}] show];
//    YLT_TipAlert(@"hahaha");
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    //ylt://HKAuthResultController/selname?status=认证失败&backTitle=返回修改&message=请核实您的姓名与身份证号是否匹配&success=true
    [YLT_RouterManager ylt_routerToURL:@"ylt://HKAuthResultController/selname?status=状态&success=true" arg:@{@"key":@"value"} completion:^(NSError *error, id response) {
        YLT_LogError(@"%@", response);
    }];
    
//    id data = [YLT_RouterManager ylt_routerToURL:@"ylt://RouterA/shareInstance.ylt_router:?username=alex&password=123456" isClassMethod:YES arg:@{@"key":@"value"} completion:^(NSError *error, id response) {
//        YLT_Log(@"%@", response);
//    }];
//    YLT_Log(@"%@", data);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
