//
//  CompanyPosition.m
//  ShiXiSeng_Main
//
//  Created by 是 撒 on 15/5/8.
//  Copyright (c) 2015年 jackson. All rights reserved.
//

#import "CompanyPosition.h"
#import "position.h"



@implementation CompanyPosition

-(void)viewwillAppear:(BOOL)animated{
    
    [_table reloadData];
    NSLog(@"公司职位页表格已刷新");
    
}

//  返回主页
-(IBAction)back:(id)sender{
    [self.navigationController popToRootViewControllerAnimated:true];
}

//  点击关注公司后的事件
-(IBAction)pressFix:(id)sender{
    if([_fix.titleLabel.text isEqualToString:@"关注公司"]){
        
    [_fix setTitle:@"已关注" forState:UIControlStateNormal];
    [_fix setTitleColor:[UIColor colorWithRed:18.0f/255.0f green:149.0f/255.0f blue:230.0f/255.0f alpha:1.0] forState:UIControlStateNormal];
    [_fix setBackgroundColor:[UIColor colorWithRed:222.0f/255.0f green:222.0f/255.0f blue:222.0f/255.0f alpha:1.0]];
    
    }
    else{
    [_fix setTitle:@"关注公司" forState:UIControlStateNormal];
    [_fix setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_fix setBackgroundColor:[UIColor colorWithRed:18.0f/255.0f green:149.0f/255.0f blue:230.0f/255.0f alpha:1.0]];
    }
}

//  实现tableview中的delegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    NSLog(@"test");
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    //long int te = self.job.count;
    //NSLog(@"%@", te);
    return 10;
}

//  为每一个单元格赋初值
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    position *cell = [tableView dequeueReusableCellWithIdentifier:@"POSITION"forIndexPath:indexPath];
    
    cell.companyname.text = @"大客户销售代表";
    cell.workdays.text = @"4天";
    cell.date.text = @"03-20发布";
    cell.salary.text = @"¥100-200/天";
    
    
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    // Configure the cell...
    
    return cell;
}


- (void)viewDidLoad {
    
//    self.table.dataSource = self;
//    self.table.delegate = self;
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
