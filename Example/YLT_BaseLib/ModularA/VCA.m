//
//  VCA.m
//  YLT_BaseLib_Example
//
//  Created by 项普华 on 2018/5/2.
//  Copyright © 2018年 xphaijj0305@126.com. All rights reserved.
//

#import "VCA.h"
#import "YLT_BaseLib.h"

@interface VCA ()

@end

@implementation VCA

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    id data = [YLT_RouterManager ylt_routerToURL:@"ylt://RouterB/ylt_router:?username=vca&password=123456" arg:@{@"key":@"value"} completion:^(NSError *error, id response) {
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
