//
//  UIView+YLT_BaseView.m
//  Pods
//
//  Created by YLT_Alex on 2017/11/16.
//

#import "UIView+YLT_BaseView.h"

@implementation UIView (YLT_BaseView)

- (void)setX:(CGFloat)x {
    self.frame = CGRectMake(x, self.y, self.width, self.height);
}

- (CGFloat)x {
    return self.frame.origin.x;
}

- (void)setY:(CGFloat)y {
    self.frame = CGRectMake(self.x, y, self.width, self.height);
}

- (CGFloat)y {
    return self.frame.origin.y;
}

- (void)setWidth:(CGFloat)width {
    self.frame = CGRectMake(self.x, self.y, width, self.height);
}

- (CGFloat)width {
    return self.frame.size.width;
}

- (void)setHeight:(CGFloat)height {
    self.frame = CGRectMake(self.x, self.y, self.width, height);
}

- (CGFloat)height {
    return self.frame.size.height;
}

- (CGFloat)centerX {
    return (self.x+self.width)/2.;
}

- (CGFloat)centerY {
    return (self.y+self.height)/2.;
}


@end
