//
//  ViewController.m
//  短信验证
//
//  Created by 清溪 on 16/3/8.
//  Copyright © 2016年 清溪. All rights reserved.
//

#import "LoginViewController.h"
#import "ViewController.h"
#import <BmobSDK/Bmob.h>
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *name;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.view.backgroundColor = [UIColor colorWithRed:1.000 green:0.483 blue:0.478 alpha:1.000];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.backgroundColor = [UIColor colorWithRed:0.522 green:1.000 blue:0.846 alpha:1.000];
    button.highlighted = YES;
    [button setTitle:@"发送验证码" forState:UIControlStateNormal];
    button.frame = CGRectMake(100, 280, 100, 45);
    [self.view addSubview:button];
    
    [button addTarget:self action:@selector(request:) forControlEvents:UIControlEventTouchUpInside];
    UITextField *field = [[UITextField alloc]initWithFrame:CGRectMake(100, 200, 200, 45)];
    field.tag = 100;
    field.placeholder = @"请输入手机号";
    field.borderStyle = UITextBorderStyleRoundedRect;
    field.clearButtonMode = YES;
    [self.view addSubview:field];
    
    UITextField *smsField = [[UITextField alloc]initWithFrame:CGRectMake(100, 350, 200, 45)];
    smsField.placeholder = @"请输入验证码";
    smsField.tag = 101;
    smsField.borderStyle =UITextBorderStyleRoundedRect;
    smsField.clearButtonMode = YES;
    smsField.hidden = YES;
    smsField.alpha = 0;
    [self.view addSubview:smsField];
    
    UIButton *enable = [UIButton buttonWithType:UIButtonTypeCustom];
    enable.backgroundColor = [UIColor colorWithRed:0.522 green:1.000 blue:0.846 alpha:1.000];
    enable.highlighted = YES;
    enable.hidden = YES;
    enable.alpha = 0;
    enable.tag = 103;
    [enable setTitle:@"确认" forState:UIControlStateNormal];
    enable.frame = CGRectMake(100, 430, 100, 45);
    [self.view addSubview:enable];
    
    [enable addTarget:self action:@selector(enable:) forControlEvents:UIControlEventTouchUpInside];
    
}

- (void)enable:(UIButton *)sender
{
    UITextField *field = [self.view viewWithTag:100];
    UITextField *smsField = [self.view viewWithTag:101];
    //验证
    
    [BmobSMS verifySMSCodeInBackgroundWithPhoneNumber:field.text andSMSCode:smsField.text resultBlock:^(BOOL isSuccessful, NSError *error) {
        if (isSuccessful) {
            NSLog(@"成功");
            LoginViewController *nac = [[LoginViewController alloc]init];
            [self.navigationController pushViewController:nac animated:YES];
            
        } else {
            NSLog(@"%@",error);
        }
    }];

     
}

- (void)request:(UIButton *)sender
{
    UITextField *field = [self.view viewWithTag:100];
    UITextField *smsField = [self.view viewWithTag:101];
//    NSString *message = @"妇女节快乐";
   /*
    [BmobSMS requestSMSInbackgroundWithPhoneNumber:field.text Content:message andSendTime:@"2015-07-01 10:59:00" resultBlock:^(int number, NSError *error) {
        if (error) {
            NSLog(@"%@",error);
        } else {
            NSLog(@"smsId:%d",number);
        }
    }];
    */
    //请求验证码
    [BmobSMS requestSMSCodeInBackgroundWithPhoneNumber:field.text andTemplate:@"Registered" resultBlock:^(int number, NSError *error) {
        if (error) {
            NSLog(@"%@",error);
        } else {
            //获得smsID
            UIButton *button = [self.view viewWithTag:103];
    [UIView animateWithDuration:1 animations:^{
        button.hidden = NO;
        smsField.hidden = NO;
        button.alpha = 1;
        smsField.alpha = 1;
    } completion:^(BOOL finished) {
        
    }];
    
        }
    }];
    

    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
