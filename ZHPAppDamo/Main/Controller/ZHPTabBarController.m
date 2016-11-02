//
//  ZHPTabBarController.m
//  ZHPAppDamo
//
//  Created by mac on 16/9/13.
//  Copyright © 2016年 zp. All rights reserved.
//

#import "ZHPTabBarController.h"

#import "ZHPNavigationController.h"
#import "ZHPCustomTabBarView.h"

#import "FirstPartViewController.h"
#import "SecondPartViewController.h"
#import "ThirdPartViewController.h"
#import "FourthPartViewController.h"

@interface ZHPTabBarController ()<ZHPCustomTabBarViewDelegate>

//自定义标签栏
@property (nonatomic,weak) ZHPCustomTabBarView *customTabbarView;

@property (nonatomic,strong) FirstPartViewController *first;
@property (nonatomic,strong) SecondPartViewController *second;
@property (nonatomic,strong) ThirdPartViewController *third;
@property (nonatomic,strong) FourthPartViewController *fourth;

@end

@implementation ZHPTabBarController


- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    for (UIView *child in self.tabBar.subviews) {
        
        if ([child isKindOfClass:[UIControl class]]) {
            [child removeFromSuperview];
        }
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //添加自定义标签栏
    [self setupTbabarView];
    
    //添加子控制器
    [self setupChilControllers];
}

#pragma mark 添加自定义标签栏
- (void)setupTbabarView{
    
    ZHPCustomTabBarView *customTabbarView = [[ZHPCustomTabBarView alloc]init];
    customTabbarView.delegate = self;
    customTabbarView.frame = self.tabBar.bounds;
    
    [self.tabBar addSubview:customTabbarView];
    
    //给视图tabbar赋值
    self.customTabbarView = customTabbarView;
}

#pragma mark 实现自定义标签试图的代理方法
- (void)tabBar:(ZHPCustomTabBarView *)tabBar didSelectedButtonFrom:(NSInteger)from to:(NSInteger)to{
//    NSLog(@"%zd--->%zd",from,to);
    self.selectedIndex = to;
}

#pragma mark 添加子控制器
- (void)setupChilControllers{
    
    FirstPartViewController *first = [[FirstPartViewController alloc]init];
    self.first = first;
    [self setChildViewController:first title:@"First" imageName:@"tabbar_damo" selectedImageName:@"tabbar_damoH"];
    
    SecondPartViewController *second = [[SecondPartViewController alloc]init];
    self.second = second;
    [self setChildViewController:second title:@"Second" imageName:@"tabbar_damo" selectedImageName:@"tabbar_damoH"];
    
    ThirdPartViewController *third = [[ThirdPartViewController alloc]init];
    self.third = third;
    [self setChildViewController:third title:@"Third" imageName:@"tabbar_damo" selectedImageName:@"tabbar_damoH"];
    
    FourthPartViewController *fourth = [[FourthPartViewController alloc]init];
    self.fourth = fourth;
    [self setChildViewController:fourth title:@"Fourth" imageName:@"tabbar_damo" selectedImageName:@"tabbar_damoH"];
    
}
#pragma mark 初始化视图控制器
- (void)setChildViewController:(UIViewController *)childViewController title:(NSString *)title imageName:(NSString *)imageName selectedImageName:(NSString *)selectedImageName{
    
    childViewController.title = title;
    childViewController.tabBarItem.image = [UIImage imageNamed:imageName];
    childViewController.tabBarItem.selectedImage = [UIImage imageNamed:selectedImageName];
    
    ZHPNavigationController *nav = [[ZHPNavigationController alloc]initWithRootViewController:childViewController];
    //添加到标签栏控制器
    [self addChildViewController:nav];
    //把UIBarItem属性传递给自定义的view
    [self.customTabbarView addTabBarButtonItem:childViewController.tabBarItem];
}

#pragma mark 返回白色的状态栏
- (UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
