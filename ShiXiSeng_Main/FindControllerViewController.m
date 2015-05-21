//
//  FindControllerViewController.m
//  ShiXiSeng_Main
//
//  Created by 是 撒 on 15/5/4.
//  Copyright (c) 2015年 jackson. All rights reserved.
//

#import "FindControllerViewController.h"
#import "YSLContainerViewController.h"
#import "PlayListTableViewController.h"
#import "ArtistsViewController.h"
#import "SampleViewController.h"

@interface FindControllerViewController ()<YSLContainerViewControllerDelegate>

@end

@implementation FindControllerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
    
    // SetUp ViewControllers
    PlayListTableViewController *playListVC = [[PlayListTableViewController alloc]initWithNibName:@"PlayListTableViewController" bundle:nil];
    playListVC.title = @"PlayList";
    
    ArtistsViewController *artistVC = [[ArtistsViewController alloc]initWithNibName:@"ArtistsViewController" bundle:nil];
    artistVC.title = @"Artists";
    
    SampleViewController *sampleVC1 = [[SampleViewController alloc]initWithNibName:@"SampleViewController" bundle:nil];
    sampleVC1.title = @"Album";
    
    SampleViewController *sampleVC2 = [[SampleViewController alloc]initWithNibName:@"SampleViewController" bundle:nil];
    sampleVC2.title = @"Track";
    
    SampleViewController *sampleVC3 = [[SampleViewController alloc]initWithNibName:@"SampleViewController" bundle:nil];
    sampleVC3.title = @"Setting";
    
    // ContainerView
    float statusHeight = [[UIApplication sharedApplication] statusBarFrame].size.height;
    float navigationHeight = self.navigationController.navigationBar.frame.size.height;
    
    YSLContainerViewController *containerVC = [[YSLContainerViewController alloc]initWithControllers:@[playListVC,artistVC,sampleVC1,sampleVC2,sampleVC3]
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
