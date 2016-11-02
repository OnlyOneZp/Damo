//
//  UIColor+ZHP.m
//  ZHPAppDamo
//
//  Created by mac on 16/9/13.
//  Copyright © 2016年 zp. All rights reserved.
//

#import "UIColor+ZHP.h"

@implementation UIColor (ZHP)

+ (UIColor *)tabbarNormalColor{
    return [UIColor lightGrayColor];
}
+ (UIColor *)tabberSelectedColor{
    
    UIColor *color = [UIColor colorWithPatternImage:[UIImage imageNamed:@"fts_green_btn"]];
    return color;
}

+ (UIColor *)navBarTintColor{
    return [UIColor whiteColor];
}
+ (UIColor *)navBarTitleTextColor{
    return [UIColor whiteColor];
}

+ (UIColor *)loginTextFieldPlaceholderColor{
    return [UIColor grayColor];
}

+ (UIColor *)loginBtnTitleColor{
    return [UIColor colorWithRed:255.0 green:255.0 blue:255.0 alpha:0.5];
}

+ (UIColor *)regisBtnTitleNormalColor{
    return [UIColor colorWithRed:71.0 green:61.0 blue:139.0 alpha:0.8];
}
+ (UIColor *)regisBtnTitleHighlightedColor{
    return [UIColor colorWithRed:0.0 green:255.0 blue:255.0 alpha:1];
}

@end
