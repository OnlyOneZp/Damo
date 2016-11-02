//
//  ZHPTabbarButton.m
//  ZHPAppDamo
//
//  Created by mac on 16/9/13.
//  Copyright © 2016年 zp. All rights reserved.
//

#import "ZHPTabbarButton.h"
#import "ZHPCommon.h"
#import "UIColor+ZHP.h"

#define kTabbarButtonRatio 0.65

@implementation ZHPTabbarButton

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.imageView.contentMode = UIViewContentModeCenter;
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        self.titleLabel.font = MyFont(11);
        
        [self setTitleColor:[UIColor tabbarNormalColor] forState:(UIControlStateNormal)];
        [self setTitleColor:[UIColor tabberSelectedColor] forState:UIControlStateSelected];
        
    }
    return self;
}

- (CGRect)imageRectForContentRect:(CGRect)contentRect{
    CGFloat imageWidth = contentRect.size.width;
    CGFloat imageHeight = contentRect.size.height *kTabbarButtonRatio;
    return CGRectMake(0, 0, imageWidth, imageHeight);
}

- (CGRect)titleRectForContentRect:(CGRect)contentRect{
    CGFloat titleWidth = contentRect.size.width;
    CGFloat imageHeight = contentRect.size.height *kTabbarButtonRatio;
    CGFloat titleHeight = contentRect.size.height -imageHeight;
    
    return CGRectMake(0, imageHeight, titleWidth, titleHeight);
}

#pragma mark 设置item
- (void)setItem:(UITabBarItem *)item{
    _item = item;
    
    //KVO  监听属性值的改变
    [item addObserver:self forKeyPath:@"image" options:NSKeyValueObservingOptionNew context:nil];
    [item addObserver:self forKeyPath:@"selectedImage" options:(NSKeyValueObservingOptionNew) context:nil];
    [item addObserver:self forKeyPath:@"title" options:(NSKeyValueObservingOptionNew) context:nil];
    
    //设置按钮
    [self setImage:item.image forState:(UIControlStateNormal)];
    [self setImage:item.selectedImage forState:(UIControlStateSelected)];
    [self setTitle:item.title forState:(UIControlStateNormal)];
}
/*
 keyPath:属性名
 object:那个对象的属性发生改变了
 change:改变的信息
 */
#pragma mark 监听item值的改变
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context{
    
    //设置按钮
    [self setImage:self.item.image forState:(UIControlStateNormal)];
    [self setImage:self.item.selectedImage forState:(UIControlStateSelected)];
    [self setTitle:self.item.title forState:(UIControlStateNormal)];
    
}

#pragma mark 回收监听
- (void)dealloc{
    [self.item removeObserver:self forKeyPath:@"image"];
    [self.item removeObserver:self forKeyPath:@"selectedImage"];
    [self.item removeObserver:self forKeyPath:@"title"];
}


@end
