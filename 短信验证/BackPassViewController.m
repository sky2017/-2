//
//  BackPassViewController.m
//  短信验证
//
//  Created by 清溪 on 16/3/12.
//  Copyright © 2016年 清溪. All rights reserved.
//

#import "BackPassViewController.h"
#import <BmobSDK/Bmob.h>
@interface BackPassViewController ()
@property (nonatomic ,strong) UITextField *UserNumber;
@property (nonatomic ,strong) UITextField *email;
@property (nonatomic ,strong) UIButton *retrievePass;
@end

@implementation BackPassViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRed:0.967 green:0.395 blue:1.000 alpha:1.000];
    [self.view addSubview:self.UserNumber];
    [self.view addSubview:self.email];
    [self.view addSubview:self.retrievePass];
    [self.retrievePass addTarget:self action:@selector(backPass) forControlEvents:UIControlEventTouchUpInside];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)backPass
{
    BmobUser *bUser = [BmobUser getCurrentUser];
    bUser.username = self.UserNumber.text;
    if (bUser) {
        //进行操作
        [BmobUser requestPasswordResetInBackgroundWithEmail:self.email.text];
        [BmobUser requestPasswordResetInBackgroundWithEmail:bUser.email];
        UIAlertController *alertcontroller = [UIAlertController alertControllerWithTitle:@"提示" message:@"请进入邮箱验证" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *alert = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            
        }];
        [self presentViewController:alertcontroller animated:YES completion:^{
            
        }];
        [alertcontroller addAction:alert];
    }else{
        //对象为空时，可打开用户注册界面
        
        UIAlertController *alertcontroller = [UIAlertController alertControllerWithTitle:@"提示" message:@"账号或邮箱不正确" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *alert = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            
        }];
        [self presentViewController:alertcontroller animated:YES completion:^{
            
        }];
        [alertcontroller addAction:alert];
    }

}
- (UITextField *)email
{
    if (_email) {
        return _email;
    }
    _email = [[UITextField alloc]initWithFrame:CGRectMake(50, 250, 200, 45)];
    _email.placeholder = @"请输入邮箱";
    _email.borderStyle = UITextBorderStyleRoundedRect;
    _email.clearButtonMode = YES;
    return _email;
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


- (UIButton *)retrievePass
{
    if (_retrievePass) {
        return _retrievePass;
    }
    _retrievePass = [UIButton buttonWithType:UIButtonTypeCustom];
    _retrievePass.frame = CGRectMake(200, 320, 120, 45);
    _retrievePass.backgroundColor = [UIColor colorWithRed:1.000 green:0.942 blue:0.528 alpha:1.000];
    _retrievePass.highlighted = YES;
    [_retrievePass setTitle:@"确认设置" forState:UIControlStateNormal];
    [_retrievePass setTitleColor:[UIColor colorWithRed:0.600 green:0.637 blue:1.000 alpha:1.000] forState:UIControlStateNormal];
    
    return _retrievePass;
}

@end
