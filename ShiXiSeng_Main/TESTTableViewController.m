//
//  TESTTableViewController.m
//  ShiXiSeng_Main
//
//  Created by 是 撒 on 15/5/8.
//  Copyright (c) 2015年 jackson. All rights reserved.
//

#import "TESTTableViewController.h"
#import "JobCell.h"
#import "SDCycleScrollView.h"

@interface TESTTableViewController ()

//  用来保存数据的数组
@property(nonatomic,strong)NSArray *job;

@end

@implementation TESTTableViewController

- (void)viewDidLoad {
    self.viewTest.delegate = self;
    self.viewTest.dataSource = self;
    [super viewDidLoad];
    //[self advtisement];
    
    //  读取本地资源文件保存数组
    NSString *fullpath=[[NSBundle mainBundle]pathForResource:@"Job.plist" ofType:nil];
    
    self.job = [NSArray arrayWithContentsOfFile:fullpath];
    NSLog(@"%@", self.job);
    NSLog(@"load!");
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

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    //long int te = self.job.count;
    //NSLog(@"%@", te);
    return self.job.count;
}

//-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    static NSString *identifier=@"JOB";
//    JobCell *cell=[tableView dequeueReusableCellWithIdentifier:identifier];
//    
//    //如果没有取到就新建
//    if (cell==nil) {
//        cell=[[JobCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
//        NSLog(@"null");
//    }
//    NSLog(@"tuyiiyiyi");
//    NSUInteger row = [indexPath row];
//    NSDictionary *rowDict = [self.job objectAtIndex:row];
//    
//    //  本地绑定数据
//    NSString *imagePath = [rowDict objectForKey:@"icon"];
//    imagePath = [imagePath stringByAppendingString:@".png"];
//    cell.companyIcon.image = [UIImage imageNamed:imagePath];
//    
//    cell.date.text = [rowDict objectForKey:@"date"];
//    cell.salary.text = [rowDict objectForKey:@"salary"];
//    cell.workday.text = [rowDict objectForKey:@"workday"];
//    cell.location.text = [rowDict objectForKey:@"location"];
//    cell.companyName.text = [rowDict objectForKey:@"company"];
//    cell.job.text = [rowDict objectForKey:@""];
//    
//    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
//    return cell;
//    
//}
//  动态广告
-(void)advtisement{
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

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"dadsdas");
    return 60;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    JobCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JOB"forIndexPath:indexPath];
    
    NSLog(@"tuyiiyiyi");
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
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
