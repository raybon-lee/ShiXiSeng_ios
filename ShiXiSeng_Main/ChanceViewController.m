//
//  ChanceViewController.m
//  ShiXiSeng_Main
//
//  Created by 是 撒 on 15/5/4.
//  Copyright (c) 2015年 jackson. All rights reserved.
//

#import "ChanceViewController.h"
#import "SDCycleScrollView.h"
#import "JobCell.h"
#import "JobTable.h"
#import "DownSheet.h"
#import "Work_Day.h"
#import "test.h"
#include "PlayListTableViewController.h"

//获取设备的物理高度
#define ScreenHeight [UIScreen mainScreen].bounds.size.height
//获取设备的物理宽度
#define ScreenWidth [UIScreen mainScreen].bounds.size.width



@implementation ChanceViewController

-(void)viewWillAppear:(BOOL)animated{
    [_work_day setTitle:@"每周实习天数"];
    [_salary_day setTitle:@"日薪(元)"];
    [_job_kind setTitle:@"职业类别"];
    [_location setTitle:@"地点"];
    [_tableview reloadData];
    NSLog(@"机会页表格已被刷新！！！");
    
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{

    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

//
////  懒加载
//-(NSArray *)job
//{
//    if (_job == nil) {
//        NSString *fullpath=[[NSBundle mainBundle]pathForResource:@"Job.plist" ofType:nil];
//        NSArray *arrayM=[NSArray arrayWithContentsOfFile:fullpath];
//        NSMutableArray *models=[NSMutableArray arrayWithCapacity:arrayM.count];
//        for (NSDictionary *dict in arrayM) {
//            Job *job = [Job jobInfoWithDict:dict];
//            [models addObject:job];
//    }
//        _job = [models copy];
//    }
//    return _job;
//}

- (void)viewDidLoad {
    
    /**
     *  绑定本地数据（每周实习天数）
     */
    //  读取本地资源文件保存数组
    NSString *fullpath1=[[NSBundle mainBundle]pathForResource:@"work_days.plist" ofType:nil];
    MenuList1 = [NSArray arrayWithContentsOfFile:fullpath1];
    _kind1 = @"   每周实习天数";
    /**
     *  绑定本地数据（日薪）
     */
    //  读取本地资源文件保存数组
    NSString *fullpath2=[[NSBundle mainBundle]pathForResource:@"salary_range.plist" ofType:nil];
    MenuList2 = [NSArray arrayWithContentsOfFile:fullpath2];
    _kind2 =@"   日薪范围";

    
    
    
    self.tableview.delegate = self;
    self.tableview.dataSource = self;
    w = ScreenWidth;
    [super viewDidLoad];
    [_job_kind setTitle:@"职位类别▾"];
    [self advtisement];
    [self toolBar_Create];
    
    //  toolbar的边界线
    UILabel *lab1 = [[UILabel alloc] initWithFrame:CGRectMake(0, 180, w, 1)];
    [lab1 setBackgroundColor:[UIColor lightGrayColor]];
    [lab1 setText:@""];
    [self.view addSubview:lab1];
    
    //  toolbar的边界线
    UILabel *lab = [[UILabel alloc] initWithFrame:CGRectMake(0, 215, w, 1)];
    [lab setBackgroundColor:[UIColor lightGrayColor]];
    [lab setText:@""];
    [self.view addSubview:lab];
    
    _searchBar=[[UISearchBar alloc]initWithFrame:CGRectMake(0,216, w, 30)];
    _searchBar.showsCancelButton = YES;
    [_searchBar setBarTintColor:[UIColor whiteColor]];
    // searchBar框框里的text
    _searchBar.placeholder = @"请输入期望的实习岗位 或公司名 或城市";
  //  _searchBar.delegate=self;
    [self.view addSubview:_searchBar];
//    UISearchDisplayController *search=[[UISearchDisplayController alloc]initWithSearchBar:searchBar contentsController:self];
//    search.searchResultsDataSource=self;//---这里是重中之重，用来显示搜索结果的代理。这个必须有
//    search.searchResultsDelegate=self;//-----还有这个也是
//    search.delegate=self;
    
    
    //  读取本地资源文件保存数组
    NSString *fullpath=[[NSBundle mainBundle]pathForResource:@"Job.plist" ofType:nil];
    self.job = [NSArray arrayWithContentsOfFile:fullpath];



}
-(void)didSelectIndex:(NSInteger)index city:(NSString*)city{
 
    [_location setTitle:city];

}
-(void)didSelectIndex:(NSInteger)index days:(NSString*)days{
    
   
        
        [_work_day setTitle:days];
    

}
-(void)didSelectIndex:(NSInteger)index money:(NSString*)money{
    [_salary_day setTitle:money];
}
-(void)didSelectIndex:(NSInteger)index text:(NSString *)text{
    
    NSString *other = @"...";
    int length = [self textLength:text];
    NSLog(@"%d, %d",[self textLength:text], [self textLength:_job_kind.title]);
    if (length <= 6) {
        [_job_kind setTitle:text];
    }else{
     
        [_job_kind setTitle:[[text substringWithRange:NSMakeRange(0, 5)] stringByAppendingString:other] ];
    }
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    NSLog(@"test");
    
    return 1;
}
- (int)textLength:(NSString *)text//计算字符串长度
{
    float number = 0.0;
    for (int index = 0; index < [text length]; index++)
    {
        NSString *character = [text substringWithRange:NSMakeRange(index, 1)];
        
        if ([character lengthOfBytesUsingEncoding:NSUTF8StringEncoding] == 3)
        {
            number++;
        }
        else
        {
            number = number + 0.5;
        }
    }
    return ceil(number);
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.job.count;
}
//  动态广告
-(void)advtisement{
    //  采用本地图片实现
    NSArray *images = @[[UIImage imageNamed:@"image0.png"],
                        [UIImage imageNamed:@"image1.png"],
                        [UIImage imageNamed:@"image2.png"],
                        [UIImage imageNamed:@"image3.png"]
                        ];
    
   

    // 本地加载 --- 创建不带标题的图片轮5器
    SDCycleScrollView *cycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 60, w, 120) imagesGroup:images];
    cycleScrollView.pageControlAliment = SDCycleScrollViewPageContolAlimentRight;

    [self.view addSubview:cycleScrollView];
    //         --- 轮播时间间隔，默认1.0秒，可自定义

}
-(void)toolBar_Create{
    
    // 添加一个UIToolBar
    UIToolbar *toolBar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 180, w, 35)];
    toolBar.tintColor = [UIColor groupTableViewBackgroundColor]; // 设置颜色
    toolBar.barStyle = UIBarButtonItemStylePlain; // 设置样式
    toolBar.translucent = YES; // 设置为半透明的，但样式必须设置为UIBarStyleBlackTranslucent
    toolBar.hidden = NO; // 隐藏toolBar
    [self.view addSubview:toolBar];
    
    

    // 添加到UIToolBar上面，并释放内存
//    [toolBar setItems:@[firstButton1, twoButton, threeButton, twoButton1, fourButton] animated:YES];
    
    //  职位类别 item
    _job_kind = [[UIBarButtonItem alloc] initWithTitle:@"职位类别▾" style:UIBarButtonItemStylePlain target:self action:@selector(doneKeyboard1)];
    _job_kind.tintColor = [UIColor blackColor];
    _job_kind.width = (w-6)/5;
    NSDictionary *attributes = @{NSFontAttributeName: [UIFont fontWithName:@"Heiti SC" size:12]};
    [_job_kind setTitleTextAttributes:attributes forState:UIControlStateNormal];
    
    //  间距1
    UIBarButtonItem *space1 = [[UIBarButtonItem alloc] initWithTitle:@"⎮" style:UIBarButtonItemStylePlain target:nil action:nil];
    [space1 setTitleTextAttributes:attributes forState:UIControlStateNormal];
    space1.tintColor = [UIColor grayColor];
    space1.width = 2;
    
    //  地点 item
    _location = [[UIBarButtonItem alloc] initWithTitle:@"地点▾" style:UIBarButtonItemStylePlain target:self action:@selector(doneKeyboard4)];
    _location.tintColor = [UIColor blackColor];
    _location.width = (w-6)/5-25;
    [_location setTitleTextAttributes:attributes forState:UIControlStateNormal];
    
    //  间距2
    UIBarButtonItem *space2 = [[UIBarButtonItem alloc] initWithTitle:@"⎮" style :UIBarButtonItemStylePlain target:nil action:nil];
    [space2 setTitleTextAttributes:attributes forState:UIControlStateNormal];
    space2.tintColor = [UIColor grayColor];
    space2.width = 2;
    
    //  每周实习天数 item
    _work_day= [[UIBarButtonItem alloc] initWithTitle:@"每周实习天数▾" style:UIBarButtonItemStylePlain target:self action:@selector(doneKeyboard2)];
    _work_day.tintColor = [UIColor blackColor];
    _work_day.width = (w-6)/4;
    [_work_day setTitleTextAttributes:attributes forState:UIControlStateNormal];

    //  间距3
    UIBarButtonItem *space3 = [[UIBarButtonItem alloc] initWithTitle:@"⎮" style :UIBarButtonItemStylePlain target:nil action:nil];
    [space3 setTitleTextAttributes:attributes forState:UIControlStateNormal];
    space3.tintColor = [UIColor grayColor];
    space3.width = 2;

    //  日薪（元） item
    _salary_day = [[UIBarButtonItem alloc] initWithTitle:@"日薪(元)▾" style:UIBarButtonItemStylePlain target:self action:@selector(doneKeyboard3)];
    _salary_day.tintColor = [UIColor blackColor];
    _salary_day.width = (w-6)/5;
    [_salary_day setTitleTextAttributes:attributes forState:UIControlStateNormal];
    
    
    toolBar.items = [NSArray arrayWithObjects: _job_kind, space1, _location, space2, _work_day, space3,_salary_day, nil];
}



-(void)doneKeyboard1{
    [_job_kind setTitle:@"职位类别▾"];
    MenuList = [[NSArray alloc]init];
    DownSheet *sheet = [[DownSheet alloc]initWithlist:MenuList height:0];
    sheet.delegate = self;
    [sheet showInView:self];

}

-(void)doneKeyboard2{
    [_work_day setTitle:@"每周实习天数▾"];
    Work_Day *sheet = [[Work_Day alloc]initWithlist:MenuList1 height:ScreenHeight/3 kind:_kind1 flag:1];
    sheet.delegate = (id)self;
    [sheet showInView:self];
}
-(void)doneKeyboard3{
    [_salary_day setTitle:@"日薪(元)▾"];
    Work_Day *sheet = [[Work_Day alloc]initWithlist:MenuList2 height:ScreenHeight/3 kind:_kind2 flag:2];
    sheet.delegate = (id)self;
    [sheet showInView:self];
}
-(void)doneKeyboard4{
    [_location setTitle:@"地点▾"];
    test *sheet = [[test alloc]initWithlist:0];
    sheet.delegate = (id)self;
    [sheet showInView:self];
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"dadsdas");
    return 60;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    JobCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JOB"forIndexPath:indexPath];
    
    NSUInteger row = [indexPath row];
    NSDictionary *rowDict = [self.job objectAtIndex:row];
    
    //  本地绑定数据
    NSString *imagePath = [rowDict objectForKey:@"icon"];
    imagePath = [imagePath stringByAppendingString:@".png"];
    cell.companyIcon.image = [UIImage imageNamed:imagePath];
    
    cell.date.text = [rowDict objectForKey:@"date"];
    cell.salary.text = [rowDict objectForKey:@"salary"];
    cell.workday.text = [rowDict objectForKey:@"workday"];
    cell.location.text = [rowDict objectForKey:@"location"];
    cell.companyName.text = [rowDict objectForKey:@"company"];
    cell.job.text = [rowDict objectForKey:@"job"];
    
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    // Configure the cell...
    
    return cell;
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
