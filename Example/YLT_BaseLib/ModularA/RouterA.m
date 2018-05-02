//
//  RouterA.m
//  YLT_BaseLib_Example
//
//  Created by 项普华 on 2018/5/2.
//  Copyright © 2018年 xphaijj0305@126.com. All rights reserved.
//

#import "RouterA.h"
#import "VCA.h"

@implementation RouterA

- (void)ylt_router:(NSDictionary *)params {
    YLT_Log(@"%@", params);
    VCA *vc = [[VCA alloc] init];
    vc.view.backgroundColor = [UIColor blueColor];
    [self.ylt_currentVC presentViewController:vc animated:YES completion:nil];
}

@end
