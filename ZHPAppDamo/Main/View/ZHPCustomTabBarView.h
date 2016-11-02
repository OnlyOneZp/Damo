//
//  ZHPCustomTabBarView.h
//  ZHPAppDamo
//
//  Created by mac on 16/9/13.
//  Copyright © 2016年 zp. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ZHPCustomTabBarView;

//代理
@protocol ZHPCustomTabBarViewDelegate <NSObject>

//可选
@optional
- (void)tabBar:(ZHPCustomTabBarView *)tabBar didSelectedButtonFrom:(NSInteger)from to:(NSInteger)to;

@end

@interface ZHPCustomTabBarView : UIView

- (void)addTabBarButtonItem:(UITabBarItem *)item;

@property (nonatomic,weak) id<ZHPCustomTabBarViewDelegate>delegate;

@end
