//
//  ZHPCustomTabBarView.m
//  ZHPAppDamo
//
//  Created by mac on 16/9/13.
//  Copyright © 2016年 zp. All rights reserved.
//

#import "ZHPCustomTabBarView.h"
#import "ZHPTabbarButton.h"

#import "ZHPCommon.h"
#import "UIView+ZHP.h"

@interface ZHPCustomTabBarView ()

@property (nonatomic,strong) NSMutableArray *buttons;
@property (nonatomic,weak) ZHPTabbarButton *tabButton;

@end

@implementation ZHPCustomTabBarView

#pragma mark 懒加载
- (NSMutableArray *)buttons{
    if (_buttons == nil) {
        _buttons = [NSMutableArray arrayWithCapacity:MyTabbarCount];
    }
    return _buttons;
}

- (instancetype)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    if (self) {
        
        
    }
    return self;
}

#pragma mark 添加按钮点击方法
- (void)addTabBarButtonItem:(UITabBarItem *)item{
    //添加按钮
    
    ZHPTabbarButton *tabButton = [[ZHPTabbarButton alloc]init];
    [self addSubview:tabButton];
    [self.buttons addObject:tabButton];
    
    tabButton.item = item;
    [tabButton addTarget:self action:@selector(tabButtonClick:) forControlEvents:(UIControlEventTouchUpInside)];
    
    //设置默认
    if (self.buttons.count == 1) {
        [self tabButtonClick:tabButton];
    }
}

#pragma mark 按钮点击方法
- (void)tabButtonClick:(ZHPTabbarButton *)sender{
    
    //调用代理
    if ([self.delegate respondsToSelector:@selector(tabBar:didSelectedButtonFrom:to:)]) {
        [self.delegate tabBar:self didSelectedButtonFrom:self.tabButton.tag to:sender.tag];
    }
    
    //三步骤
    self.tabButton.selected = NO;
    sender.selected = YES;
    self.tabButton = sender;
    
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
    CGFloat buttonW = self.cWidth /self.buttons.count;
    CGFloat buttonH = self.cHeight;
    
    CGFloat buttonY = 0.0;
    for (int i =0; i <self.buttons.count; i ++) {
        ZHPTabbarButton *tabbarButton = self.buttons[i];
        tabbarButton.tag = i;
        CGFloat buttonX = i *buttonW;
        tabbarButton.frame = CGRectMake(buttonX, buttonY, buttonW, buttonH);
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/




@end
