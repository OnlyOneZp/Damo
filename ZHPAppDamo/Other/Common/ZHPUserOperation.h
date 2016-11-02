//
//  ZHPUserOperation.h
//  ZHPAppDamo
//
//  Created by mac on 16/9/13.
//  Copyright © 2016年 zp. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Singleton.h"

@interface ZHPUserOperation : NSObject

SingletonH(user);

@property (nonatomic,copy) NSString *loginName;
@property (nonatomic,copy) NSString *loginPassword;

@property (nonatomic,assign) BOOL loginStatus;

+ (void)loginByStatus;

@end
