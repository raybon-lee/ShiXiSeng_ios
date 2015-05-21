//
//  MessageViewController.m
//  ShiXiSeng_Main
//
//  Created by 是 撒 on 15/5/2.
//  Copyright (c) 2015年 jackson. All rights reserved.
//

#import "MessageViewController.h"
#import "SDCycleScrollView.h"
#import "YSLContainerViewController.h"
#import "PlayListTableViewController.h"
#import "ArtistsViewController.h"
#import "SampleViewController.h"

#import "RefuseMsg.h"
#import "InteMsg.h"
#import "lookMsg.h"
#import "AllMsg.h"

@interface MessageViewController ()<YSLContainerViewControllerDelegate>

@end

@implementation MessageViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // SetUp ViewControllers
  
    
    AllMsg *all = [[AllMsg alloc] initWithNibName:@"AllMsg" bundle:nil];
    all.title = @"全部";
    lookMsg *look = [[lookMsg alloc] initWithNibName:@"lookMsg" bundle:nil];
    look.title = @"被查看";
    InteMsg *inte = [[InteMsg alloc] initWithNibName:@"InteMsg" bundle:nil];
    inte.title = @"通知面试";
    RefuseMsg *refuse = [[RefuseMsg alloc] initWithNibName:@"RefuseMsg" bundle:nil];
    refuse.title = @"不合适";
    
    
    
    
    // ContainerView
    float statusHeight = [[UIApplication sharedApplication] statusBarFrame].size.height;
    float navigationHeight = self.navigationController.navigationBar.frame.size.height;
    
    YSLContainerViewController *containerVC = [[YSLContainerViewController alloc]initWithControllers:@[ all, look, inte, refuse]
                                                                                        topBarHeight:statusHeight + navigationHeight
                                                                                parentViewController:self];
    containerVC.delegate = self;
    containerVC.menuItemFont = [UIFont fontWithName:@"Futura-Medium" size:16];
    
    [self.view addSubview:containerVC.view];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -- YSLContainerViewControllerDelegate
- (void)containerViewItemIndex:(NSInteger)index currentController:(UIViewController *)controller
{
    //    NSLog(@"current Index : %ld",(long)index);
    //    NSLog(@"current controller : %@",controller);
    [controller viewWillAppear:YES];
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
