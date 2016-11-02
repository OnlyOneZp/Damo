//
//  ZHPUserOperation.m
//  ZHPAppDamo
//
//  Created by mac on 16/9/13.
//  Copyright © 2016年 zp. All rights reserved.
//

#import "ZHPUserOperation.h"
#import "ZHPCommon.h"

#import "ZHPLogInViewController.h"
#import "ZHPTabBarController.h"
#import "ZHPNavigationController.h"

#define kLoginName @"kLoginName"
#define kLoginPassword @"kLoginPassword"
#define kLoginStatus @"kLoginStatus"

@implementation ZHPUserOperation

SingletonM(user);

- (void)setLoginName:(NSString *)loginName{
    
    [MyDefaults setObject:loginName forKey:kLoginName];
    
    [MyDefaults synchronize];
}
- (void)setLoginPassword:(NSString *)loginPassword{
    
    [MyDefaults setObject:loginPassword forKey:kLoginPassword];
    
    [MyDefaults synchronize];
}
-(void)setLoginStatus:(BOOL)loginStatus
{
    [MyDefaults setBool:loginStatus forKey:kLoginStatus];
    [MyDefaults synchronize];
}


- (NSString *)loginName{
    
    NSString *name= [MyDefaults objectForKey:kLoginName];
    return name;
}

- (NSString *)loginPassword{
    
    NSString *pass=[MyDefaults objectForKey:kLoginPassword];
    return pass;
}

-(BOOL)loginStatus
{
    BOOL status=[MyDefaults boolForKey:kLoginStatus];
    return status;
}

+ (void)loginByStatus{
    NSLog(@"loginByStatus");
    
    ZHPUserOperation *user = [ZHPUserOperation shareduser];
    
    if (user.loginStatus) {
        
        ZHPTabBarController *tabbar = [[ZHPTabBarController alloc]init];
        [[[UIApplication sharedApplication] delegate] window].rootViewController = tabbar;
        
    }else{
        
        ZHPLoginViewController *login = [[ZHPLoginViewController alloc]init];
        ZHPNavigationController *nav = [[ZHPNavigationController alloc]initWithRootViewController:login];
        
        [[[UIApplication sharedApplication] delegate] window].rootViewController = nav;
        
        
    }
    
}

@end
