//
//  FirstPartViewController.m
//  ZHPAppDamo
//
//  Created by mac on 16/9/14.
//  Copyright © 2016年 zp. All rights reserved.
//

#import "FirstPartViewController.h"
#import "ZHPCommon.h"

@interface FirstPartViewController ()

@end

@implementation FirstPartViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"First";
    
    self.view.backgroundColor = [UIColor purpleColor];
    
    
    [self testPush];
}

- (void)testPush{
    UIButton *button = [[UIButton alloc]initWithFrame:(CGRectMake(0, 0, 100, 40))];
    button.center = CGPointMake(ScreenWidth /2, ScreenWidth /2);
    
    [button setBackgroundColor:[UIColor redColor]];
    
    [button addTarget:self action:@selector(btnClick) forControlEvents:(UIControlEventTouchUpInside)];
    
    [self.view addSubview:button];
}

- (void)btnClick{
    
    UIViewController *vc = [[UIViewController alloc]init];
    vc.view.backgroundColor = [UIColor yellowColor];
    
    [self.navigationController pushViewController:vc animated:YES];
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
