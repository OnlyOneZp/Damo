//
//  ZHPLoginTextField.m
//  ZHPAppDamo
//
//  Created by mac on 16/9/14.
//  Copyright © 2016年 zp. All rights reserved.
//

#import "ZHPLoginTextField.h"
#import "ZHPCommon.h"
#import "UIColor+ZHP.h"

@interface ZHPLoginTextField ()

@property (nonatomic,weak) UIImageView *imageView;

@end

@implementation ZHPLoginTextField

- (instancetype)init{
    self = [super init];
    if (self) {
        self.font = MyFont(14);
    }
    return self;
}

- (void)setConstomPlaceholder:(NSString *)constomPlaceholder{
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    dict[NSForegroundColorAttributeName] = [UIColor loginTextFieldPlaceholderColor];
    self.attributedPlaceholder = [[NSAttributedString alloc]initWithString:constomPlaceholder attributes:dict];
}

- (void)setImage:(NSString *)image{
    UIImageView *imgView = [[UIImageView alloc]init];
    imgView.frame = CGRectMake(0, 10, 30, 30);
    imgView.image = [UIImage imageNamed:image];
    self.leftViewMode = UITextFieldViewModeAlways;
    self.leftView = imgView;
    self.imageView = imgView;
}

- (CGRect)leftViewRectForBounds:(CGRect)bounds{
    return CGRectMake(10, 10, 30, 0);
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
    self.imageView.frame = CGRectMake(0, 0, 30, 30);
}

//添加右上角完成
- (void)drawRect:(CGRect)rect {
    
    [super drawRect:rect];
    
    UIToolbar *bar = [[UIToolbar alloc] initWithFrame:CGRectMake(0,0, ScreenWidth,30)];
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0, 0,50, 25)];
    [button setTitle:@"完成"forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(finishTapped:) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *item2 = [[UIBarButtonItem alloc]initWithCustomView:button];
    
    UIView *space = [[UIView alloc]initWithFrame:(CGRectMake(0, 0, ScreenWidth - button.frame.size.width - 30, 25))];
    
    UIBarButtonItem *item = [[UIBarButtonItem alloc]initWithCustomView:space];
    
    [bar setItems:@[item,item2] animated:YES];
    
    self.inputAccessoryView = bar;
    
    
}

- (void)finishTapped:(UIButton *)sender{
    
//    NSLog(@"finishTapped");
    
    [self resignFirstResponder];
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
