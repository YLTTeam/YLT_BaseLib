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
    UITabBarController *controller = [[UITabBarController alloc] init];
    NSLog(@"%f   %f", controller.tabBar.frame.size.height, [UIScreen mainScreen].bounds.size.height);
//    NSString *routerURL = @"ylt://classname/ylt_router?username=alex&password=123456";
//    [YLT_RouterManager ylt_routerToURL:routerURL arg:@{@"user":@"alex"} completion:^(NSError *error, id response) {
//
//    }];
//    [[LGAlertView alertViewWithTitle:@"sdfsdf" message:nil style:LGAlertViewStyleAlert buttonTitles:nil cancelButtonTitle:@"确定" destructiveButtonTitle:nil actionHandler:nil cancelHandler:nil destructiveHandler:^(LGAlertView * _Nonnull alertView) {}] show];
//    YLT_TipAlert(@"hahaha");
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [YLT_RouterManager ylt_routerToURL:@"ylt://RouterB/ylt_router:?username=alex&password=123456" arg:@{@"key":@"value"} completion:^(NSError *error, id response) {
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
