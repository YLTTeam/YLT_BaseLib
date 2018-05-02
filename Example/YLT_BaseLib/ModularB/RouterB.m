//
//  RouterB.m
//  YLT_BaseLib_Example
//
//  Created by 项普华 on 2018/5/2.
//  Copyright © 2018年 xphaijj0305@126.com. All rights reserved.
//

#import "RouterB.h"
#import "VCB.h"

@implementation RouterB

- (void)routerBData:(NSDictionary *)params {
    NSMutableDictionary *data = [[NSMutableDictionary alloc] initWithDictionary:params];
    [data setObject:@"hahhaha" forKey:@"alex"];
    self.completion(nil, data);
}

- (void)ylt_router:(NSDictionary *)params {
    YLT_Log(@"%@", params);
    VCB *vc = [[VCB alloc] init];
    vc.view.backgroundColor = [UIColor redColor];
    [self.ylt_currentVC presentViewController:vc animated:YES completion:nil];
}

@end
