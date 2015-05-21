//
//  work_exp.m
//  ShiXiSeng_Main
//
//  Created by 是 撒 on 5/20/15.
//  Copyright (c) 2015 jackson. All rights reserved.
//

#import "work_exp.h"

@interface work_exp ()
@property (nonatomic, strong) CNPPopupController *popupController;
@end

@implementation work_exp
-(IBAction)pop:(id)sender{
    [self.navigationController popoverPresentationController];
}
-(void)didSelect:(NSString *)timestring{
    [_chosetime00 setTitle:timestring forState:UIControlStateNormal];
}
-(void)didSelect1:(NSString *)timestring{
    [_chosetim11 setTitle:timestring forState:UIControlStateNormal];
}

-(IBAction)save:(id)sender{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"恭喜您" message:@"   保存成功！" delegate:self cancelButtonTitle:@"返回" otherButtonTitles:nil];
    [alert show];
}

-(IBAction)press1:(id)sender{
    __flag_ = 2;
    [_chosetime00 setTitle:@"入职时间" forState:UIControlStateNormal];
    [self showPopupWithStyle:CNPPopupStyleCentered];
}
-(IBAction)press2:(id)sender{
    __flag_ = 0;
    [_chosetim11 setTitle:@"到职时间" forState:UIControlStateNormal];
    [self showPopupWithStyle:CNPPopupStyleCentered];
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
