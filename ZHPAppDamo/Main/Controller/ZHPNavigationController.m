//
//  ZHPNavigationController.m
//  ZHPAppDamo
//
//  Created by mac on 16/9/13.
//  Copyright © 2016年 zp. All rights reserved.
//

#import "ZHPNavigationController.h"
#import "UIImage+ZHP.h"
#import "UIColor+ZHP.h"

@interface ZHPNavigationController ()

@end

@implementation ZHPNavigationController

+ (void)initialize{
    UINavigationBar *navBar = [UINavigationBar appearance];
    [navBar setBackgroundImage:[UIImage NavigationImage] forBarMetrics:(UIBarMetricsDefault)];
    [navBar setTintColor:[UIColor navBarTintColor]];
    [navBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor navBarTitleTextColor]}];
    
    //隐藏导航栏底部的线
    navBar.shadowImage = [[UIImage alloc]init];
    
    //设置导航栏barButton上面文字的颜色
    UIBarButtonItem *item = [UIBarButtonItem appearance];
    [item setTintColor:[UIColor navBarTintColor]];
    [item setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor navBarTitleTextColor]} forState:(UIControlStateNormal)];
}

#pragma mark 当push的时候调用这个方法
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    
    if (self.viewControllers.count >0) {
        //当push时隐藏标签栏
        viewController.hidesBottomBarWhenPushed = YES;
    }
    
    [super pushViewController:viewController animated:animated];
}

#pragma mark 返回白色的状态栏
- (UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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
