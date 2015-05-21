//
//  JobTable.m
//  ShiXiSeng_Main
//
//  Created by 是 撒 on 15/5/8.
//  Copyright (c) 2015年 jackson. All rights reserved.
//

#import "JobTable.h"
#import "JobCell.h"

@interface JobTable ()

@property(nonatomic,strong)NSArray *job;

@end

@implementation JobTable

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //  读取本地资源文件保存数组
    NSBundle *bundle = [NSBundle mainBundle];
    NSString *plistPath = [bundle pathForResource:@"job" ofType:@"plist"];
    self.job = [[NSArray alloc] initWithContentsOfFile:plistPath];
    
 }

//  为容器设置位置的方法
+ (instancetype)JobTableViewWithFrame:(CGRect)frame {
    JobTable *jobt = [[self alloc] initWithFrame:frame];
    return jobt;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    //     表格的长度
    return self.job.count;
}
//-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    static NSString *identifier=@"jobinfo";
//    JobCell *cell=[tableView dequeueReusableCellWithIdentifier:identifier];
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

//  为单元表格附值
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identifier = @"JobCell";
    
    JobCell *cell = (JobCell*)[tableView dequeueReusableCellWithIdentifier:identifier];
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
