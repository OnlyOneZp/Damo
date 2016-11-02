//
//  ZHPCommon.h
//  ZHPAppDamo
//
//  Created by mac on 16/9/13.
//  Copyright © 2016年 zp. All rights reserved.
//

#ifndef ZHPCommon_h
#define ZHPCommon_h

#import "UIColor+ZHP.h"
#import "UIImage+ZHP.h"
#import "UIView+ZHP.h"

//屏幕的宽度
#define ScreenWidth [UIScreen mainScreen].bounds.size.width
//屏幕的高度
#define ScreenHeight [UIScreen mainScreen].bounds.size.height

#define MyDefaults [NSUserDefaults standardUserDefaults]

#define MyNotification [NSNotificationCenter defaultCenter]

#define MyFont(s)  [UIFont systemFontOfSize:(s)]

#define MyTabbarCount 5

#endif /* ZHPCommon_h */
