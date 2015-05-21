//  发现主页实现代码
//  FindViewController.m
//  ShiXiSeng_Main
//
//  Created by 是 撒 on 15/5/4.
//  Copyright (c) 2015年 jackson. All rights reserved.
//



#import "FindViewController.h"
#import "SDCycleScrollView.h"
#import "YSLContainerViewController.h"
#import "PlayListTableViewController.h"
#import "ArtistsViewController.h"
#import "SampleViewController.h"
#import "JobTable.h"

@interface FindViewController ()<YSLContainerViewControllerDelegate>
@property (strong,nonatomic)IBOutlet UIScrollView *scrollview;

@end

@implementation FindViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self CylcleAdvertisement];
    [self ChangeTable];
    
}

//  轮播图
-(void)CylcleAdvertisement{
    //  采用本地图片实现
    NSArray *images = @[[UIImage imageNamed:@"image0.png"],
                        [UIImage imageNamed:@"image1.png"],
                        [UIImage imageNamed:@"image2.png"],
                        [UIImage imageNamed:@"image3.png"]
                        ];
    
    CGFloat w = self.view.bounds.size.width;
    
    // 本地加载 --- 创建不带标题的图片轮5器
    SDCycleScrollView *cycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 60, w, 120) imagesGroup:images];
    cycleScrollView.pageControlAliment = SDCycleScrollViewPageContolAlimentRight;
    //cycleScrollView.delegate = self;
    
    [self.view addSubview:cycleScrollView];
    //         --- 轮播时间间隔，默认1.0秒，可自定义
}
//  切换视图
-(void)ChangeTable{
    // SetUp ViewControllers
    PlayListTableViewController *playListVC = [[PlayListTableViewController alloc]initWithNibName:@"PlayListTableViewController" bundle:nil];
    playListVC.title = @"经验谈";
    
    ArtistsViewController *artistVC = [[ArtistsViewController alloc]initWithNibName:@"ArtistsViewController" bundle:nil];
    artistVC.title = @"好文推";
    
    SampleViewController *sampleVC1 = [[SampleViewController alloc]initWithNibName:@"SampleViewController" bundle:nil];
    sampleVC1.title = @"技巧论";
    
    SampleViewController *sampleVC2 = [[SampleViewController alloc]initWithNibName:@"SampleViewController" bundle:nil];
    sampleVC2.title = @"八卦粥";
   
   
    
    // ContainerView
    float statusHeight = [[UIApplication sharedApplication] statusBarFrame].size.height;
    float navigationHeight = self.navigationController.navigationBar.frame.size.height;
    
    // 将写好的表格放进容器内
    YSLContainerViewController *containerVC = [[YSLContainerViewController alloc]initWithControllers:@[ playListVC, artistVC, sampleVC1, sampleVC2]
                                                                                        topBarHeight:statusHeight + navigationHeight
                                                                                parentViewController:self];
    containerVC.delegate = self;
    containerVC.menuItemFont = [UIFont fontWithName:@"Futura-Medium" size:16];
    
    [self.scrollview addSubview:containerVC.view];

}
#pragma mark -- YSLContainerViewControllerDelegate
- (void)containerViewItemIndex:(NSInteger)index currentController:(UIViewController *)controller
{
    //    NSLog(@"current Index : %ld",(long)index);
    //    NSLog(@"current controller : %@",controller);
    [controller viewWillAppear:YES];
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
