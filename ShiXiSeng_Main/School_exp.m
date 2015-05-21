//
//  School_exp.m
//  ShiXiSeng_Main
//
//  Created by 是 撒 on 5/20/15.
//  Copyright (c) 2015 jackson. All rights reserved.
//

#import "School_exp.h"

@interface School_exp ()

@end

@implementation School_exp

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
-(IBAction)pop:(id)sender{
    [self.navigationController popoverPresentationController];
}
-(IBAction)save:(id)sender{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"恭喜您" message:@"   保存成功！" delegate:self cancelButtonTitle:@"返回" otherButtonTitles:nil];
    [alert show];
}
-(IBAction)pressKind:(id)sender{
    [_btn setTitle:@"请选择经历" forState:UIControlStateNormal];
    /**
     *  绑定本地数据（可实习时间）
     */
    //  读取本地资源文件保存数组
    NSString *fullpath5 =[[NSBundle mainBundle]pathForResource:@"school_exp.plist" ofType:nil];
    MenuList = [NSArray arrayWithContentsOfFile:fullpath5];
    _kind =@"   请选择经历";
    Work_Day *sheet = [[Work_Day alloc]initWithlist:MenuList height:2*ScreenHeight/5 kind:_kind flag:6];
    sheet.delegate = self;
    [sheet showInView:self];
}
-(void)didSelectIndex:(NSInteger)index skill:(NSString *)skill{
    [_btn setTitle:skill forState:UIControlStateNormal];
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
