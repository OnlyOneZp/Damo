//
//  UIImage+ZHP.m
//  ZHPAppDamo
//
//  Created by mac on 16/9/13.
//  Copyright © 2016年 zp. All rights reserved.
//

#import "UIImage+ZHP.h"

@implementation UIImage (ZHP)

+ (UIImage *)NavigationImage{
    UIImage *image = [UIImage resizedImage:@"topbarbg_ios7"];
    return image;
}

+ (UIImage *)resizedImage:(NSString *)name{
    
    UIImage *image = [UIImage imageNamed:name];
    return [image stretchableImageWithLeftCapWidth:image.size.width * 0.5 topCapHeight:image.size.height * 0.5];
}

+(UIImage *)resizedImage:(NSString *)name left:(CGFloat)left top:(CGFloat)top{
    UIImage *image=[UIImage imageNamed:name];
    image=[image stretchableImageWithLeftCapWidth:image.size.width*left topCapHeight:image.size.height*top];
    return image;
}

+ (NSString *)loginUserTextfieldImage{
    return @"biz_pc_main_info_profile_login_user_icon";
}
+ (NSString *)loginPasswordTextfieldImage{
    return @"biz_pc_main_info_profile_login_pw_icon";
}

+ (UIImage *)loginBtnNormalImage{
    return [UIImage resizedImage:@"fts_green_btn"];
}
+ (UIImage *)loginBtnHighlightedImage{
    return [UIImage resizedImage:@"fts_green_btn_HL"];
}
+ (UIImage *)loginBtnDisabledImage{
    return [UIImage resizedImage:@"GreenBigBtnDisable"];
}

@end
