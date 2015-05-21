//
//  Hope.m
//  ShiXiSeng_Main
//
//  Created by 是 撒 on 5/20/15.
//  Copyright (c) 2015 jackson. All rights reserved.
//

#import "Hope.h"

@interface Hope ()
@property (nonatomic, strong) CNPPopupController *popupController;
@end

@implementation Hope
-(IBAction)save:(id)sender{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"恭喜您" message:@"   保存成功！" delegate:self cancelButtonTitle:@"返回" otherButtonTitles:nil];
    [alert show];
}
-(IBAction)jobTime:(id)sender{
    [_timeclick setTitle:@"请选择时间" forState:UIControlStateNormal];
    [self showPopupWithStyle:CNPPopupStyleCentered];
}
-(void)didSelect:(NSString *)timestring{
    [_timeclick setTitle:timestring forState:UIControlStateNormal];
}
- (void)showPopupFormSheet:(id)sender {
    [self showPopupWithStyle:CNPPopupStyleActionSheet];
}

- (void)showPopupFullscreen:(id)sender {
    [self showPopupWithStyle:CNPPopupStyleFullscreen];
}

- (void)showPopupWithStyle:(CNPPopupStyle)popupStyle {
    
    NSMutableParagraphStyle *paragraphStyle = NSMutableParagraphStyle.new;
    paragraphStyle.lineBreakMode = NSLineBreakByWordWrapping;
    paragraphStyle.alignment = NSTextAlignmentCenter;
    
    
    
    NSAttributedString *buttonTitle = [[NSAttributedString alloc] initWithString:@"保存" attributes:@{NSFontAttributeName : [UIFont boldSystemFontOfSize:18], NSForegroundColorAttributeName : [UIColor whiteColor], NSParagraphStyleAttributeName : paragraphStyle}];
    
    CNPPopupButtonItem *buttonItem = [CNPPopupButtonItem defaultButtonItemWithTitle:buttonTitle backgroundColor:[UIColor colorWithRed:0.46 green:0.8 blue:1.0 alpha:1.0]];
        buttonItem.selectionHandler = ^(CNPPopupButtonItem *item){
    };
    
    self.popupController = [[CNPPopupController alloc] initWithTitle:@" 预期到岗时间" flag:2 buttonItems:@[buttonItem] destructiveButtonItem:nil];
    self.popupController.theme = [CNPPopupTheme defaultTheme];
    self.popupController.theme.popupStyle = popupStyle;
    self.popupController.delegate = self;
    self.popupController.theme.presentationStyle = CNPPopupPresentationStyleSlideInFromBottom;
    [self.popupController presentPopupControllerAnimated:YES];
}

#pragma mark - CNPPopupController Delegate

- (void)popupController:(CNPPopupController *)controller didDismissWithButtonTitle:(NSString *)title {
    //NSLog(@"Dismissed with button title: %@", title);
}

- (void)popupControllerDidPresent:(CNPPopupController *)controller {
    //NSLog(@"Popup controller presented.");
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    /**
     *  绑定本地数据（每周实习天数）
     */
    //  读取本地资源文件保存数组
    
}
-(IBAction)job_kind:(id)sender{
    [_job_kind setTitle:@"请选择职业类别" forState:UIControlStateNormal];
    /**
     *  绑定本地数据（发送周期）
     */
    //  读取本地资源文件保存数组
    MenuList = [[NSArray alloc]init];
    DownSheet *sheet = [[DownSheet alloc]initWithlist:MenuList height:0];
    sheet.delegate = self;
    [sheet showInView:self];
}
-(IBAction)hopeday:(id)sender{
    NSString *fullpath1=[[NSBundle mainBundle]pathForResource:@"work_days.plist" ofType:nil];
    MenuList = [NSArray arrayWithContentsOfFile:fullpath1];
    _kind = @"   每周实习天数";
    [_hope_day setTitle:@"请选择时间" forState:UIControlStateNormal];
    Work_Day *sheet = [[Work_Day alloc]initWithlist:MenuList height:ScreenHeight/3 kind:_kind flag:1];
    sheet.delegate = self;
    [sheet showInView:self];
    
}
-(IBAction)work_time1:(id)sender{
    [_work_time setTitle:@"请选择时间" forState:UIControlStateNormal];
    /**
     *  绑定本地数据（可实习时间）
     */
    //  读取本地资源文件保存数组
    NSString *fullpath5 =[[NSBundle mainBundle]pathForResource:@"work_time.plist" ofType:nil];
    MenuList = [NSArray arrayWithContentsOfFile:fullpath5];
    _kind =@"   可实习时间";
    Work_Day *sheet = [[Work_Day alloc]initWithlist:MenuList height:ScreenHeight/2 kind:_kind flag:5];
    sheet.delegate = self;
    [sheet showInView:self];
}
-(IBAction)presscity:(id)sender{
    [_city setTitle:@"请选择地点" forState:UIControlStateNormal];
    test *sheet = [[test alloc]initWithlist:0];
    sheet.delegate = self;
    [sheet showInView:self];

}
-(void)didSelectIndex:(NSInteger)index text:(NSString *)text{
    [_job_kind setTitle:text forState:UIControlStateNormal];
}
-(void)didSelectIndex:(NSInteger)index workday:(NSString *)workday{
    [_work_time setTitle:workday forState:UIControlStateNormal];
}
-(void)didSelectIndex:(NSInteger)index days:(NSString*)days{
    

    
    [_hope_day setTitle:days forState:UIControlStateNormal];
    
    
}
-(void)didSelectIndex:(NSInteger)index city:(NSString*)city{
    
    [_city setTitle:city forState:UIControlStateNormal];
    
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
