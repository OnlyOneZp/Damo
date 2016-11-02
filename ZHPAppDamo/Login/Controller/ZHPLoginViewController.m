//
//  ZHPLoginViewController.m
//  ZHPAppDamo
//
//  Created by mac on 16/9/13.
//  Copyright © 2016年 zp. All rights reserved.
//

#import "ZHPLoginViewController.h"
#import "ZHPTabBarController.h"
#import "ZHPLoginTextField.h"
#import "ZHPUserOperation.h"
#import "ZHPCommon.h"

#define commonMargin 220
#define marginX 20
#define textFieldWidth  (ScreenWidth-2*marginX)
#define textFieldHeight 30

@interface ZHPLoginViewController ()<UITextFieldDelegate>

//登陆按钮
@property (nonatomic,weak) UIButton *loginBtn;
@property (nonatomic,weak) ZHPLoginTextField *username;
@property (nonatomic,weak) ZHPLoginTextField *pass;

@property (nonatomic,weak) UITextField *currentTextField;

@end

@implementation ZHPLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"login";
    self.view.backgroundColor = [UIColor whiteColor];
    
    NSLog(@"ZHPLoginViewController");
    
    //添加子控件
    [self setupChild];
    //添加手势识别器
    [self addGesture];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark 添加子控件
- (void)setupChild{
    
    //1.添加输入用户名的框
    ZHPLoginTextField *username=[[ZHPLoginTextField alloc]init];
    username.delegate = self;
    username.frame = CGRectMake(marginX, commonMargin, textFieldWidth, textFieldHeight);
    username.image = [UIImage loginUserTextfieldImage];
    username.constomPlaceholder = @"请输入用户名/手机号";
    [self.view addSubview:username];
    self.username = username;
    //2.添加下划线
    CGFloat oneLineY = commonMargin +textFieldHeight +10;
    [self addbottomLineWith:CGRectMake(marginX, oneLineY, textFieldWidth, 0.5)];
    //3.添加密码输入框
    ZHPLoginTextField *pass = [[ZHPLoginTextField alloc]init];
    pass.secureTextEntry = YES;
    pass.delegate = self;
    CGFloat passY = commonMargin+textFieldHeight +20;
    pass.frame = CGRectMake(marginX, passY, textFieldWidth, textFieldHeight);
    pass.image = [UIImage loginPasswordTextfieldImage];
    pass.constomPlaceholder = @"请输入密码";
    [self.view addSubview:pass];
    self.pass = pass;
    //4.添加下划线
    CGFloat twoLineY = passY +textFieldHeight +10;
    [self addbottomLineWith:CGRectMake(marginX, twoLineY, textFieldWidth, 0.5)];
    //5.添加登陆按钮
    CGFloat loginbtnY = twoLineY +20;
    [self addLoginButton:CGRectMake(marginX, loginbtnY, textFieldWidth, 40)];
    //6添加注册按钮
//    CGFloat regisW = 40;
//    CGFloat regisH = 30;
//    CGFloat regisX = (ScreenWidth -regisW) *0.5;
//    CGFloat regisY = self.view.height -64 -regisH -10;
//    [self addRegisButton:CGRectMake(regisX, regisY, regisW, regisH)];
    
}

#pragma mark 添加下划线的方法
-(void)addbottomLineWith:(CGRect)bounds
{
    UIImageView *line=[[UIImageView alloc]initWithFrame:bounds];
    //line.width=0.5;
    line.backgroundColor=[UIColor lightGrayColor];
    [self.view addSubview:line];
}

#pragma mark 添加登陆按钮
-(void)addLoginButton:(CGRect)bounds
{
    UIButton *btn = [[UIButton alloc]initWithFrame:bounds];
    self.loginBtn = btn;
    btn.enabled = NO;
    
    //PayCardLightGreenBG   fts_green_btn
    [btn setBackgroundImage:[UIImage resizedImage:@"fts_green_btn"] forState:UIControlStateNormal];
    [btn setBackgroundImage:[UIImage resizedImage:@"fts_green_btn_HL"] forState:UIControlStateHighlighted];
    [btn setBackgroundImage:[UIImage resizedImage:@"GreenBigBtnDisable"] forState:UIControlStateDisabled];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor loginBtnTitleColor] forState:UIControlStateDisabled];
    [btn setTitle:@"登陆" forState:UIControlStateNormal];
    
    [btn addTarget:self action:@selector(loginClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
}

#pragma mark 添加注册按钮
-(void)addRegisButton:(CGRect)bounds
{
    UIButton *reg = [[UIButton alloc]initWithFrame:bounds];
    reg.titleLabel.font = MyFont(14);
    [reg setTitle:@"注册" forState:UIControlStateNormal];
    [reg setTitleColor:[UIColor regisBtnTitleNormalColor] forState:UIControlStateNormal];
    [reg setTitleColor:[UIColor regisBtnTitleHighlightedColor] forState:UIControlStateHighlighted];
    [reg addTarget:self action:@selector(regisClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:reg];
}

-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    if(self.username.text.length != 0 && self.pass.text.length != 0){
        self.loginBtn.enabled = YES;
    }
    // NSLog(@"%@  %zd",textField.text,textField.text.length);
    if(textField.text.length <= 1){
        self.loginBtn.enabled = NO;
    }
    
    return YES;
}


#pragma mark 点击登陆的方法
-(void)loginClick
{
    NSLog(@"loginClick");
    
    ZHPUserOperation *user=[ZHPUserOperation shareduser];
    user.loginStatus=YES; //登录成功保存登录状态
    //清空输入框里面的文字
    self.username.text=nil;
    self.pass.text=nil;
    
    [self dismissViewControllerAnimated:NO completion:nil];
    
    ZHPTabBarController *tab=[[ZHPTabBarController alloc]init];
    [self presentViewController:tab animated:NO completion:nil];
}
#pragma mark 注册按钮点击方法
-(void)regisClick
{
    NSLog(@"regisClick");
}

#pragma mark 添加手势识别器
- (void)addGesture{
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapClick:)];
    tap.numberOfTapsRequired = 1;
    [self.view addGestureRecognizer:tap];
}
#pragma mark 点击的方法
-(void)tapClick:(id)sender
{
    [self.view endEditing:YES];
}

#pragma mark textfield代理
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    _currentTextField = textField;
    return YES;
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [self.view endEditing:YES];
    return YES;
}

#pragma mark 添加键盘通知
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    [MyNotification addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    [MyNotification addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
    
}
#pragma mark 移除键盘通知
- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    
    [self.view endEditing:YES];
    [MyNotification removeObserver:self];
}
#pragma mark 键盘弹出
- (void)keyboardWillShow:(NSNotification *)notification{
    
    CGRect keyboardFrame = [notification.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    
    CGFloat height = keyboardFrame.origin.y -30;//存在完成按钮
    CGFloat textField_maxY = _currentTextField.frame.origin.y;
    CGFloat space = _currentTextField.frame.size.height +textField_maxY;
    CGFloat transformY = height - space;
    
//    NSLog(@"%f,%f,%f,%f",height,textField_maxY,space,transformY);
    
    if (transformY < 0) {
        CGRect frame = self.view.frame;
        frame.origin.y = transformY ;
        self.view.frame = frame;
    }
}
#pragma mark 移除隐藏
- (void)keyboardWillHide:(NSNotification *)notification{
    CGRect frame = self.view.frame;
    frame.origin.y = 64;
    self.view.frame = frame;
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
