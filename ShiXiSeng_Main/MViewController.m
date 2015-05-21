//
//  MViewController.m
//  ShiXiSeng_Main
//
//  Created by 是 撒 on 15/5/4.
//  Copyright (c) 2015年 jackson. All rights reserved.
//

#import "MViewController.h"

@interface MViewController ()

@end

@implementation MViewController

-(void)viewWillAppear:(BOOL)animated{
    
    NSLog(@"头像数据, 学校/专业, 姓名, 数据已经刷新");

}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
    //  画布的宽度
    long int width = (self.view.bounds.size.width/2)-40;
    
    //  创建一个uibutton（用来设置个人基本资料）
    UIButton *uibutton = [[UIButton alloc]initWithFrame:CGRectMake(width, 50, 80, 80)];
    [uibutton setTitle:@"Test" forState:UIControlStateDisabled];
    [uibutton setImage:[UIImage imageNamed:@"头像.png"] forState:UIControlStateNormal];
    
    //  给uibutton添加一个点击事件引导用户进入下一页
    [uibutton addTarget:self action:@selector(Button2Method) forControlEvents:UIControlEventTouchUpInside];

    
    //  创建一个label设置名字(18号字体)
    UILabel *Name = [[UILabel alloc]initWithFrame:CGRectMake(0, 120, self.view.bounds.size.width, 80)];
    [Name setText:@"鲁炎"];
    [Name setTextAlignment:NSTextAlignmentCenter];
    [Name setFont:[UIFont fontWithName:@"Helvetica-Bold" size:18]];
    [Name setTextColor:[UIColor whiteColor]];
    
    //  创建一个label设置个人信息（学校／专业）
    UILabel *Details = [[UILabel alloc]initWithFrame:CGRectMake(0, 180, self.view.bounds.size.width, 40)];
    [Details setTextAlignment:NSTextAlignmentCenter];
    [Details setText:@"四川大学／软件工程"];
    [Details setTextColor:[UIColor whiteColor]];
    [Details setFont:[UIFont systemFontOfSize:14]];
    
    //  依次给向背景图层里面加入button, name, Details
    [self.uiimage addSubview:uibutton];
    [self.uiimage addSubview:Name];
    [self.uiimage addSubview:Details];
    self.uiimage.userInteractionEnabled = YES;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//  uibutton的点击事件（进入下一步）
-(void)Button2Method
{
    NSLog(@"This is Test for ClickButton!");
    [self performSegueWithIdentifier:@"BasicInfo" sender:self];
    
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
