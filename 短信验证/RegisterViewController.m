//
//  RegisterViewController.m
//  短信验证
//
//  Created by 清溪 on 16/3/9.
//  Copyright © 2016年 清溪. All rights reserved.
//

#import "RegisterViewController.h"
#import <BmobSDK/Bmob.h>
#import "LoginViewController.h"
@interface RegisterViewController ()
@property (nonatomic ,strong) UIButton *RegisterButton;
@property (nonatomic ,strong) UITextField *UserNumber;
@property (nonatomic ,strong) UITextField *passworld;
@property (nonatomic ,strong) UIButton *backLogin;
@property (nonatomic ,strong) UITextField *Email;
@end

@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor colorWithRed:1.000 green:0.483 blue:0.478 alpha:1.000];
    [self.view addSubview:self.RegisterButton];
    [self.view addSubview:self.UserNumber];
    [self.view addSubview:self.passworld];
    [self.view addSubview:self.backLogin];
    [self.view addSubview:self.Email];
    [self.backLogin addTarget:self action:@selector(backLogin:) forControlEvents:UIControlEventTouchUpInside];
    [self.RegisterButton addTarget:self action:@selector(registUser) forControlEvents:UIControlEventTouchUpInside];
    

    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}
- (void)backLogin:(UIButton *)sender
{
    [self.navigationController pushViewController:[[LoginViewController alloc]init] animated:YES];
}

//注册功能
- (void)registUser
{
    UITextField *email = self.Email;
    UITextField *userfield = self.UserNumber;
    UITextField *passfield = self.passworld;
    if (userfield.text.length==0) {
        UIAlertController *alertcontroller = [UIAlertController alertControllerWithTitle:@"提示" message:@"请输入账号" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *alert = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {

        }];
        [self presentViewController:alertcontroller animated:YES completion:^{
            
        }];
        [alertcontroller addAction:alert];
        
    }else if (passfield.text.length==0) {
        UIAlertController *alertcontroller = [UIAlertController alertControllerWithTitle:@"提示" message:@"请输入密码" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *alert = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {

        }];
        [self presentViewController:alertcontroller animated:YES completion:^{
            
        }];
        [alertcontroller addAction:alert];
        
    }else if(email.text.length==0)
    {
        UIAlertController *alertcontroller = [UIAlertController alertControllerWithTitle:@"提示" message:@"请输入邮箱" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *alert = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            
        }];
        [self presentViewController:alertcontroller animated:YES completion:^{
            
        }];
        [alertcontroller addAction:alert];
    
    }
        
       else if (userfield.text.length!=0&&passfield.text.length!=0&&email.text.length!=0){
        NSLog(@"%@    %@",userfield.text ,passfield.text);
    BmobUser *bUser = [[BmobUser alloc] init];
    bUser.username = self.UserNumber.text;
    bUser.email = self.Email.text;
    [bUser setPassword:self.passworld.text];
    
    [bUser signUpInBackgroundWithBlock:^ (BOOL isSuccessful, NSError *error){
        if (isSuccessful){
            NSLog(@"Sign up successfully");

                UIAlertController *alertcontroller = [UIAlertController alertControllerWithTitle:@"注册成功" message:@"请到你邮箱中进行验证" preferredStyle:UIAlertControllerStyleAlert];
                UIAlertAction *alert = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {

                }];
                UIAlertAction *alert1 = [UIAlertAction actionWithTitle:@"返回登陆" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                    
                    [self presentViewController:[[LoginViewController alloc]init] animated:YES completion:^{
                        
                    }];
                }];
                [self presentViewController:alertcontroller animated:YES completion:^{
                    
                }];
                [alertcontroller addAction:alert1];
                [alertcontroller addAction:alert];
            


            
            
           
            
            
                    } else {
                        UIAlertController *alertcontroller = [UIAlertController alertControllerWithTitle:@"提示" message:@"可能有重复用户" preferredStyle:UIAlertControllerStyleAlert];
                        UIAlertAction *alert = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                            
                        }];
                        [self presentViewController:alertcontroller animated:YES completion:^{
                            
                        }];
                        [alertcontroller addAction:alert];
            NSLog(@"%@",error);
                        
        }
    }];
    
    }
}

- (UITextField *)passworld
{
    if (_passworld) {
        return _passworld;
    }
    _passworld = [[UITextField alloc]initWithFrame:CGRectMake(50, 250, 200, 45)];
    _passworld.placeholder = @"请输入密码";
    _passworld.borderStyle = UITextBorderStyleRoundedRect;
    _passworld.clearButtonMode = YES;
    return _passworld;
}

- (UITextField *)UserNumber
{
    if (_UserNumber) {
        return _UserNumber;
    }
    _UserNumber = [[UITextField alloc]initWithFrame:CGRectMake(50, 100, 200, 45)];
    _UserNumber.placeholder = @"请输入账号";
    _UserNumber.borderStyle = UITextBorderStyleRoundedRect;
    _UserNumber.clearButtonMode = YES;
    return _UserNumber;
}

- (UITextField *)Email
{
    if (_Email) {
        return _Email;
    }
    _Email = [[UITextField alloc]initWithFrame:CGRectMake(50, 500, 200, 45)];
    _Email.borderStyle = UITextBorderStyleRoundedRect;
    _Email.placeholder = @"请输入邮箱";
    _Email.clearButtonMode = YES;
    
    return _Email;
}
- (UIButton *)backLogin
{
    if (_backLogin) {
        return _backLogin;
    }
    _backLogin = [UIButton buttonWithType:UIButtonTypeCustom];
    _backLogin.frame = CGRectMake(250, 180, 120, 45);
    _backLogin.backgroundColor = [UIColor colorWithRed:1.000 green:0.942 blue:0.528 alpha:1.000];
    _backLogin.highlighted = YES;
    [_backLogin setTitle:@"返回登陆" forState:UIControlStateNormal];
    [_backLogin setTitleColor:[UIColor colorWithRed:0.600 green:0.637 blue:1.000 alpha:1.000] forState:UIControlStateNormal];
    return _backLogin;
}
- (UIButton *)RegisterButton
{
    if (_RegisterButton) {
        return _RegisterButton;
    }
    _RegisterButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _RegisterButton.frame = CGRectMake(50, 180, 120, 45);
    _RegisterButton.backgroundColor = [UIColor colorWithRed:1.000 green:0.942 blue:0.528 alpha:1.000];
    _RegisterButton.highlighted = YES;
    [_RegisterButton setTitle:@"注册账号" forState:UIControlStateNormal];
    [_RegisterButton setTitleColor:[UIColor colorWithRed:0.600 green:0.637 blue:1.000 alpha:1.000] forState:UIControlStateNormal];
    return _RegisterButton;
}

@end
