//
//  UIView+ZHP.m
//  ZHPAppDamo
//
//  Created by mac on 16/9/14.
//  Copyright © 2016年 zp. All rights reserved.
//

#import "UIView+ZHP.h"

@implementation UIView (ZHP)

- (void)setCX:(CGFloat)cX{
    CGRect frame = self.frame;
    frame.origin.x = cX;
    self.frame = frame;
}
- (CGFloat)cX{
    return self.frame.origin.x;
}

- (void)setCY:(CGFloat)cY{
    CGRect frame = self.frame;
    frame.origin.y = cY;
    self.frame = frame;
}
- (CGFloat)cY{
    return self.frame.origin.y;
}

- (void)setCWidth:(CGFloat)cWidth{
    CGRect frame = self.frame;
    frame.size.width = cWidth;
    self.frame = frame;
}
- (CGFloat)cWidth{
    return self.frame.size.width;
}

- (void)setCHeight:(CGFloat)cHeight{
    CGRect frame = self.frame;
    frame.size.height = cHeight;
    self.frame = frame;
}
- (CGFloat)cHeight{
    return self.frame.size.height;
}

- (void)setCCenterX:(CGFloat)cCenterX{
    CGPoint center = self.center;
    center.x = cCenterX;
    self.center = center;
}
- (CGFloat)cCenterX{
    return self.center.x;
}

- (void)setCCenterY:(CGFloat)cCenterY{
    CGPoint center = self.center;
    center.y = cCenterY;
    self.center = center;
}
- (CGFloat)cCenterY{
    return self.center.y;
}

- (void)setCSize:(CGSize)cSize{
    CGRect frame = self.frame;
    frame.size = cSize;
    self.frame = frame;
}
- (CGSize)cSize{
    return self.frame.size;
}

- (void)setCOrigin:(CGPoint)cOrigin{
    CGRect frame = self.frame;
    frame.origin = cOrigin;
    self.frame = frame;
}
- (CGPoint)cOrigin{
    return self.frame.origin;
}


@end
