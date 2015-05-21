//
//  ExitViewController.m
//  ShiXiSeng_Main
//
//  Created by 是 撒 on 15/5/4.
//  Copyright (c) 2015年 jackson. All rights reserved.
//

#import "ExitViewController.h"

@interface ExitViewController ()

@end

@implementation ExitViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)tapLoginOut:(id)sender {
    
    
    
    //获取UserDefaults单例
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    //移除UserDefaults中存储的用户信息
    [userDefaults removeObjectForKey:@"name"];
    [userDefaults removeObjectForKey:@"password"];
    [userDefaults synchronize];
    //获取storyboard
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    //获取注销后要跳转的页面
    id view = [storyboard instantiateViewControllerWithIdentifier:@"LoginView"];
    //模态展示出登陆页面
    [self presentViewController:view animated:YES completion:^{
    }];
}
-(IBAction)pressleftbutton:(id)sender{
    [self.navigationController popToRootViewControllerAnimated:true];
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
