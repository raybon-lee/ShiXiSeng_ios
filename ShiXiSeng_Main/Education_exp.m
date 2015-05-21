//
//  Education_exp.m
//  ShiXiSeng_Main
//
//  Created by 是 撒 on 5/20/15.
//  Copyright (c) 2015 jackson. All rights reserved.
//

#import "Education_exp.h"

@interface Education_exp ()
@property (nonatomic, strong) CNPPopupController *popupController;
@end

@implementation Education_exp
-(IBAction)pressstudy:(id)sender{
    [_kind setTitle:@"请选择学历" forState:UIControlStateNormal];
    /**
     *  绑定本地数据（最低学历）
     */
    //  读取本地资源文件保存数组
    NSString *fullpath3=[[NSBundle mainBundle]pathForResource:@"lowest_study.plist" ofType:nil];
    menu = [NSArray arrayWithContentsOfFile:fullpath3];
    _kind1 = @"   最低学历";
    Work_Day *sheet = [[Work_Day alloc]initWithlist:menu height:ScreenHeight/3 kind:_kind1 flag:4];
    sheet.delegate = self;
    [sheet showInView:self];
    
}
-(void)didSelectIndex:(NSInteger)index study:(NSString *)study{
    [_kind setTitle:study forState:UIControlStateNormal];
}

-(IBAction)presstim1:(id)sender{
    __flag_ = 3;
    [_tim1 setTitle:@"入学时间" forState:UIControlStateNormal];
    [self showPopupWithStyle:CNPPopupStyleCentered];
}
-(IBAction)presstim2:(id)sender{
    __flag_ = 9;
    [_tim2 setTitle:@"毕业时间" forState:UIControlStateNormal];
    [self showPopupWithStyle:CNPPopupStyleCentered];
}
-(void)didSelect:(NSString *)timestring{
    [_tim1 setTitle:timestring forState:UIControlStateNormal];
}
-(void)didSelect2:(NSString *)timestring{
    [_tim2 setTitle:timestring forState:UIControlStateNormal];
}
- (void)showPopupWithStyle:(CNPPopupStyle)popupStyle {
    
    NSMutableParagraphStyle *paragraphStyle = NSMutableParagraphStyle.new;
    paragraphStyle.lineBreakMode = NSLineBreakByWordWrapping;
    paragraphStyle.alignment = NSTextAlignmentCenter;
    
    
    
    NSAttributedString *buttonTitle = [[NSAttributedString alloc] initWithString:@"保存" attributes:@{NSFontAttributeName : [UIFont boldSystemFontOfSize:18], NSForegroundColorAttributeName : [UIColor whiteColor], NSParagraphStyleAttributeName : paragraphStyle}];
    
    CNPPopupButtonItem *buttonItem = [CNPPopupButtonItem defaultButtonItemWithTitle:buttonTitle backgroundColor:[UIColor colorWithRed:0.46 green:0.8 blue:1.0 alpha:1.0]];
    buttonItem.selectionHandler = ^(CNPPopupButtonItem *item){
    };
    
    self.popupController = [[CNPPopupController alloc] initWithTitle:@" 项目时间" flag:__flag_ buttonItems:@[buttonItem] destructiveButtonItem:nil];
    self.popupController.theme = [CNPPopupTheme defaultTheme];
    self.popupController.theme.popupStyle = popupStyle;
    self.popupController.delegate = self;
    self.popupController.theme.presentationStyle = CNPPopupPresentationStyleSlideInFromBottom;
    [self.popupController presentPopupControllerAnimated:YES];
}

-(IBAction)save:(id)sender{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"恭喜您" message:@"   保存成功！" delegate:self cancelButtonTitle:@"返回" otherButtonTitles:nil];
    [alert show];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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
