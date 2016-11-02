//
//  UIImage+ZHP.h
//  ZHPAppDamo
//
//  Created by mac on 16/9/13.
//  Copyright © 2016年 zp. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (ZHP)

//拉伸图片
+(UIImage *)resizedImage:(NSString *)name;
+(UIImage *)resizedImage:(NSString *)name left:(CGFloat)left top:(CGFloat)top;

//导航栏背景图片
+ (UIImage *)NavigationImage;

+ (NSString *)loginUserTextfieldImage;
+ (NSString *)loginPasswordTextfieldImage;
+ (UIImage *)loginBtnNormalImage;
+ (UIImage *)loginBtnHighlightedImage;
+ (UIImage *)loginBtnDisabledImage;
@end
