//
//  LoginViewController.m
//  短信验证
//
//  Created by 清溪 on 16/3/8.
//  Copyright © 2016年 清溪. All rights reserved.
//

#import "LoginViewController.h"
#import "BackPassViewController.h"
#import <BmobSDK/Bmob.h>
@interface LoginViewController ()
@property (nonatomic ,strong) UITextField *UserNumber;
@property (nonatomic ,strong) UITextField *passworld;
@property (nonatomic ,strong) UIButton *loginButton;
@property (nonatomic ,strong) UIButton *retrievePass;
@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRed:0.559 green:1.000 blue:0.829 alpha:1.000];
    [self.view addSubview:self.UserNumber];
    [self.view addSubview:self.passworld];
    [self.view addSubview:self.loginButton];
    [self.view addSubview:self.retrievePass];
    [self.retrievePass addTarget:self action:@selector(retrieve) forControlEvents:UIControlEventTouchUpInside];
    [self.loginButton addTarget:self action:@selector(login) forControlEvents:UIControlEventTouchUpInside];
    
}
//找回密码
- (void)retrieve
{
    BackPassViewController *vc = [[BackPassViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];

}
//登录功能
- (void)login
{
    
    [BmobUser loginWithUsernameInBackground:self.UserNumber.text password:self.passworld.text block:^(BmobUser *user, NSError *error) {
                                       //登陆后返回的用户信息
        NSLog(@"%@",user.email);
                                       if (user!=nil) {
                                           UIAlertController *alertcontroller = [UIAlertController alertControllerWithTitle:@"提示" message:@"登陆成功" preferredStyle:UIAlertControllerStyleAlert];
                                           UIAlertAction *alert = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
                                               
                                           }];
                                           [self presentViewController:alertcontroller animated:YES completion:^{
                                               
                                           }];
                                           [alertcontroller addAction:alert];

                                       }else  {
                                           UIAlertController *alertcontroller = [UIAlertController alertControllerWithTitle:@"登陆失败" message:@"账号密码错误" preferredStyle:UIAlertControllerStyleAlert];
                                           UIAlertAction *alert = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
                                               
                                           }];
                                           [self presentViewController:alertcontroller animated:YES completion:^{
                                               
                                           }];
                                           [alertcontroller addAction:alert];
                                           NSLog(@"%@",error);
                                       }
                                       
                                   }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (UIButton *)loginButton
{
    if (_loginButton) {
        return _loginButton;
    }
    _loginButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _loginButton.frame = CGRectMake(50, 320, 120, 45);
    _loginButton.backgroundColor =[UIColor colorWithRed:1.000 green:0.942 blue:0.528 alpha:1.000];
    _loginButton.highlighted = YES;
    [_loginButton setTitle:@"登陆" forState:UIControlStateNormal];
    [_loginButton setTitleColor:[UIColor colorWithRed:0.600 green:0.637 blue:1.000 alpha:1.000] forState:UIControlStateNormal];
    return _loginButton;
    
}
- (UIButton *)retrievePass
{
    if (_retrievePass) {
        return _retrievePass;
    }
    _retrievePass = [UIButton buttonWithType:UIButtonTypeCustom];
    _retrievePass.frame = CGRectMake(200, 320, 120, 45);
    _retrievePass.backgroundColor = [UIColor colorWithRed:1.000 green:0.942 blue:0.528 alpha:1.000];
    _retrievePass.highlighted = YES;
    [_retrievePass setTitle:@"找回密码" forState:UIControlStateNormal];
    [_retrievePass setTitleColor:[UIColor colorWithRed:0.600 green:0.637 blue:1.000 alpha:1.000] forState:UIControlStateNormal];
    
    return _retrievePass;
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
