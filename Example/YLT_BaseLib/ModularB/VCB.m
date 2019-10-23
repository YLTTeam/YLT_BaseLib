//
//  VCB.m
//  YLT_BaseLib_Example
//
//  Created by 项普华 on 2018/5/2.
//  Copyright © 2018年 xphaijj0305@126.com. All rights reserved.
//

#import "VCB.h"

#import "YLT_BaseLib.h"

@interface VCB ()
@property (nonatomic, assign) CGFloat time;
@end

@implementation VCB

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.redColor;
    self.time = [[NSDate date] timeIntervalSince1970];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    [YLT_RouterManager ylt_routerToURL:@"ylt://RouterA/ylt_router:?username=vcb&password=123456" arg:@{@"key":@"value"} completion:^(NSError *error, id response) {
//        YLT_Log(@"%@", response);
//    }];
    id data = [YLT_RouterManager ylt_routerToClassname:@"RouterA" selname:@"shareInstance.ylt_router:?username=vcb&password" isClassMethod:NO arg:@{@"key":@"value"} completion:^(NSError *error, id response) {
        YLT_Log(@"%@", response);
    }];
    YLT_Log(@"%@", data);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
