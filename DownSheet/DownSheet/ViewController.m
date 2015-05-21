//
//  ViewController.m
//  DownSheet
//
//  Created by wolf on 14-11-30.
//  Copyright (c) 2014年 wolf. All rights reserved.
//

#import "ViewController.h"

@interface ViewController1 ()

@property (strong, nonatomic) UIButton *button;


@end

@implementation ViewController1

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{

    [super viewDidLoad];
    [self initDemoData];
    
    
    
    _button = [[UIButton alloc]initWithFrame:CGRectMake(50, 50, 210, 100)];
    [_button setTitle:@"弹出菜单演示" forState:UIControlStateNormal];
    [_button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_button addTarget:self action:@selector(clickMenu) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_button];

	// Do any additional setup after loading the view.
}

-(void)initDemoData{

    MenuList = [[NSArray alloc]init];
    
}

-(void)clickMenu{
    DownSheet *sheet = [[DownSheet alloc]initWithlist:MenuList height:0];
    sheet.delegate = self;
    [sheet showInView:nil];
}

-(void)didSelectIndex:(NSInteger)index text:(NSString *)text{


   
        [_button setTitle:text forState:UIControlStateNormal];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

// 版权属于原作者
// http://code4app.com (cn) http://code4app.net (en)
// 发布代码于最专业的源码分享网站: Code4App.com 
