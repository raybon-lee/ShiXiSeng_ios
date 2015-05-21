//
//  workday.m
//  DownSheet
//
//  Created by 是 撒 on 5/18/15.
//  Copyright (c) 2015 wolf. All rights reserved.
//

#import "workday.h"

//获取设备的物理高度
#define ScreenHeight [UIScreen mainScreen].bounds.size.height
//获取设备的物理宽度
#define ScreenWidth [UIScreen mainScreen].bounds.size.width

@interface workday ()

@property (strong, nonatomic) UIButton *button;

@end

@implementation workday

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initDemoData];
    
    
    
    _button = [[UIButton alloc]initWithFrame:CGRectMake(50, 50, 210, 100)];
    [_button setTitle:@"弹出菜单演示" forState:UIControlStateNormal];
    [_button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_button addTarget:self action:@selector(clickMenu) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_button];

}
-(void)initDemoData{
    
    MenuList = [[NSArray alloc]init];
    /**
     *  绑定本地数据（每周实习天数）
     */
    //  读取本地资源文件保存数组
    NSString *fullpath=[[NSBundle mainBundle]pathForResource:@"work_days.plist" ofType:nil];
    MenuList = [NSArray arrayWithContentsOfFile:fullpath];
    _kind1 = @"   每周实习天数";
    /**
     *  绑定本地数据（日薪）
     */
    //  读取本地资源文件保存数组
    NSString *fullpath1=[[NSBundle mainBundle]pathForResource:@"salary_range.plist" ofType:nil];
    MenuList1 = [NSArray arrayWithContentsOfFile:fullpath1];
    _kind2 =@"   日薪范围";
    /**
     *  绑定本地数据（最低学历）
     */
    //  读取本地资源文件保存数组
    NSString *fullpath3=[[NSBundle mainBundle]pathForResource:@"lowest_study.plist" ofType:nil];
    MenuList2 = [NSArray arrayWithContentsOfFile:fullpath3];
    _kind3 =@"   最低学历";
    /**
     *  绑定本地数据（发送周期）
     */
    //  读取本地资源文件保存数组
    NSString *fullpath4=[[NSBundle mainBundle]pathForResource:@"send_cycle.plist" ofType:nil];
    MenuList3 = [NSArray arrayWithContentsOfFile:fullpath4];
    _kind4 =@"   发送周期";
    /**
     *  绑定本地数据（可实习时间）
     */
    //  读取本地资源文件保存数组
    NSString *fullpath5 =[[NSBundle mainBundle]pathForResource:@"work_time.plist" ofType:nil];
    Menulist4 = [NSArray arrayWithContentsOfFile:fullpath5];
    _kind5 =@"   可实习时间";
    /**
     *  绑定本地数据（校园经历）
     */
    //  读取本地资源文件保存数组
    NSString *fullpath6 =[[NSBundle mainBundle]pathForResource:@"school_exp.plist" ofType:nil];
    MenuList5 = [NSArray arrayWithContentsOfFile:fullpath6];
    _kind6 =@"   可实习时间";
    
}

-(void)clickMenu{
//    Work_Day *sheet = [[Work_Day alloc]initWithlist:MenuList5 height:ScreenHeight/3 kind:_kind6];
//    sheet.delegate = self;
//    [sheet showInView:nil];
    /**
     email在使用的时候会出现挡住屏幕
     */
//    Receive_email *sheet = [[Receive_email alloc]initWithlist:ScreenHeight/5 kind:_kind4];
//    [sheet showInView:nil];
    _kind7 = @"   出生日期";
    time_window *sheet = [[time_window alloc] initWithlist:_kind7];
    [sheet showInView:nil];

}

-(void)didSelectIndex:(NSInteger)index text:(NSString *)text{
    
    
    
    [_button setTitle:text forState:UIControlStateNormal];
    
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
