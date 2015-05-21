//
//  TestController.m
//  ShiXiSeng_Main
//
//  Created by 是 撒 on 15/5/8.
//  Copyright (c) 2015年 jackson. All rights reserved.
//

#import "TestController.h"
#import "JobCell.h"

@interface TestController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)NSArray *job;

@end

@implementation TestController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //  读取本地资源文件保存数组
    NSBundle *bundle = [NSBundle mainBundle];
    NSString *plistPath = [bundle pathForResource:@"job" ofType:@"plist"];
    self.job = [[NSArray alloc] initWithContentsOfFile:plistPath];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.job.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier=@"jobCells";
    JobCell *cell=[tableView dequeueReusableCellWithIdentifier:identifier];
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
    cell.job.text = [rowDict objectForKey:@""];
    
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
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
