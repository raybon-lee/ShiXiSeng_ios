//
//  job_sub_content.m
//  ShiXiSeng_Main
//
//  Created by 是 撒 on 5/19/15.
//  Copyright (c) 2015 jackson. All rights reserved.
//

#import "job_sub_content.h"

@interface job_sub_content ()

@end

@implementation job_sub_content

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
-(IBAction)pressIndustry:(id)sender{
    [_industry setTitle:@"行业领域（必填）" forState:UIControlStateNormal];
    industry *sheet = [[industry alloc]initWithlist:0];
    [sheet showInView:self];
}
-(IBAction)presslocation:(id)sender{
    [_location setTitle:@"工作地点（必填）" forState:UIControlStateNormal];
    test *sheet = [[test alloc]initWithlist:0];
    sheet.delegate = self;
    [sheet showInView:self];
}
-(IBAction)presskind:(id)sender{
   [_kind setTitle:@"职业类别（必填）" forState:UIControlStateNormal];
    /**
     *  绑定本地数据（发送周期）
     */
    //  读取本地资源文件保存数组
    MenuList = [[NSArray alloc]init];
    DownSheet *sheet = [[DownSheet alloc]initWithlist:MenuList height:0];
    sheet.delegate = self;
    [sheet showInView:self];
    
}
-(IBAction)presscycle:(id)sender{
    [_cycle setTitle:@"发送周期（必填）" forState:UIControlStateNormal];
    /**
     *  绑定本地数据（发送周期）
     */
    //  读取本地资源文件保存数组
    NSString *fullpath4=[[NSBundle mainBundle]pathForResource:@"send_cycle.plist" ofType:nil];
    MenuList = [NSArray arrayWithContentsOfFile:fullpath4];
    _kind1 =@"   发送周期";

    Work_Day *sheet = [[Work_Day alloc]initWithlist:MenuList height:ScreenHeight/4 kind:_kind1 flag:3];
    sheet.delegate = self;
    [sheet showInView:self];

}
-(void)didSelect:(NSString *)industry{
    [_industry setTitle:industry forState:UIControlStateNormal];
}
-(void)didSelectIndex:(NSInteger)index cycle:(NSString *)cycle{
    
    
    [_cycle setTitle:cycle forState:UIControlStateNormal];
    
}
-(void)didSelectIndex:(NSInteger)index text:(NSString *)text{
    [_kind setTitle:text forState:UIControlStateNormal];
}
-(void)didSelectIndex:(NSInteger)index city:(NSString*)city{
    
    [_location setTitle:city forState:UIControlStateNormal];
    
}
-(void)didSelectIndex:(NSInteger)index industry:(NSString *)industry{
    [_industry setTitle:industry forState:UIControlStateNormal];
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
