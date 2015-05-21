//
//  Fill_Record.m
//  ShiXiSeng_Main
//
//  Created by 是 撒 on 5/14/15.
//  Copyright (c) 2015 jackson. All rights reserved.
//

#import "Fill_Record.h"
#import "Fill_Record_Cell.h"

@interface Fill_Record ()

@end

@implementation Fill_Record

-(void)viewWillAppear:(BOOL)animated{
    NSLog(@"个人简历页表格被刷新了！！！");
    [_table reloadData];
}

- (void)viewDidLoad {
    [super viewDidLoad];

//    Do any additional setup after loading the view.
//      画布的宽度
//    long int width = (self.view.bounds.size.width/2)-40;
    
    //  创建一个uibutton（用来设置个人基本资料）
    UIButton *uibutton = [[UIButton alloc]initWithFrame:CGRectMake(10, 25, 70, 70)];
    [uibutton setTitle:@"Test" forState:UIControlStateDisabled];
    [uibutton setImage:[UIImage imageNamed:@"头像.png"] forState:UIControlStateNormal];
    
    //  给uibutton添加一个点击事件引导用户进入下一页
    [uibutton addTarget:self action:@selector(Button2Method) forControlEvents:UIControlEventTouchUpInside];
    
    
    //  创建一个edit button（用来编辑个人基本资料）
    UIButton *edit = [[UIButton alloc]initWithFrame:CGRectMake(280, 15, 90, 30)];
    [edit setTitle:@"编辑" forState:UIControlStateDisabled];
    [edit setTintColor:[UIColor whiteColor]];
    [edit setImage:[UIImage imageNamed:@"编辑"] forState:UIControlStateNormal];
    [edit setEnabled:YES];
    
    //  给uibutton添加一个点击事件引导用户进入下一页
    [edit addTarget:self action:@selector(Button2Method) forControlEvents:UIControlEventTouchUpInside];
    
    //  创建一个label设置名字(18号字体)
    UILabel *Name = [[UILabel alloc]initWithFrame:CGRectMake(100, 15, 60, 20)];
    [Name setText:@"鲁炎"];
    [Name setTextAlignment:NSTextAlignmentCenter];
    [Name setFont:[UIFont fontWithName:@"Helvetica-Bold" size:14]];
    [Name setTextColor:[UIColor whiteColor]];
    
    //  创建一个label设置性别
    UILabel *sex = [[UILabel alloc]initWithFrame:CGRectMake(145, 16, 60, 20)];
    [sex setTextAlignment:NSTextAlignmentCenter];
    [sex setText:@"男"];
    [sex setTextColor:[UIColor whiteColor]];
    [sex setFont:[UIFont fontWithName:@"Helvetica" size:12]];
    
    //  创建一个label设置学位
    UILabel *degree = [[UILabel alloc]initWithFrame:CGRectMake(175, 16, 60, 20)];
    [degree setTextAlignment:NSTextAlignmentCenter];
    [degree setText:@"本科"];
    [degree setTextColor:[UIColor whiteColor]];
    [degree setFont:[UIFont fontWithName:@"Helvetica" size:12]];
    
    //  创建一个school图标
    UIButton *school_icon = [[UIButton alloc]initWithFrame:CGRectMake(103, 50, 30, 30)];
    
    [school_icon setImage:[UIImage imageNamed:@"school"] forState:UIControlStateNormal];
    
    //  创建一个label设置学校/专业
    UILabel *school = [[UILabel alloc]initWithFrame:CGRectMake(130, 55, 200, 20)];
    [school setTextAlignment:NSTextAlignmentLeft];
    [school setText:@"四川大学/软件学院"];
    [school setTextColor:[UIColor whiteColor]];
    [school setFont:[UIFont fontWithName:@"Helvetica" size:10]];
    
    //  创建一个phone图标
    UIButton *phone_icon = [[UIButton alloc]initWithFrame:CGRectMake(103, 65, 30, 30)];
    
    [phone_icon setImage:[UIImage imageNamed:@"phone"] forState:UIControlStateNormal];
    
    //  创建一个label设置电话
    UILabel *phone = [[UILabel alloc]initWithFrame:CGRectMake(130, 71, 200, 20)];
    [phone setTextAlignment:NSTextAlignmentLeft];
    [phone setText:@"13980460618"];
    [phone setTextColor:[UIColor whiteColor]];
    [phone setFont:[UIFont fontWithName:@"Helvetica" size:10]];
    
    //  创建一个email图标
    UIButton *email_icon = [[UIButton alloc]initWithFrame:CGRectMake(103, 80, 30, 30)];
    
    [email_icon setImage:[UIImage imageNamed:@"email"] forState:UIControlStateNormal];
    
    //  创建一个label设置邮箱
    UILabel *email = [[UILabel alloc]initWithFrame:CGRectMake(130, 85, 200, 20)];
    [email setTextAlignment:NSTextAlignmentLeft];
    [email setText:@"420391244@qq.com"];
    [email setTextColor:[UIColor whiteColor]];
    [email setFont:[UIFont fontWithName:@"Helvetica" size:10]];
    
    //  依次给向背景图层里面加入button, name, Details
    [self.bg addSubview:uibutton];
    [self.bg addSubview:edit];
    [self.bg addSubview:Name];
    [self.bg addSubview:sex];
    [self.bg addSubview:degree];
    [self.bg addSubview:school_icon];
    [self.bg addSubview:school];
    [self.bg addSubview:phone_icon];
    [self.bg addSubview:phone];
    [self.bg addSubview:email_icon];
    [self.bg addSubview:email];
    self.bg.userInteractionEnabled = YES;
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

//  uibutton的点击事件（进入下一步）
-(void)Button2Method
{
    NSLog(@"This is Test for ClickButton!");
    [self performSegueWithIdentifier:@"edit" sender:self];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    // Return the number of rows in the section.
    return 6;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    Fill_Record_Cell *cell = [tableView dequeueReusableCellWithIdentifier:@"kind" forIndexPath:indexPath];
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(100, 40, self.view.frame.size.width-200, 30)];
    [btn setTitle:@"更多信息填写" forState:UIControlStateNormal];
    
    [btn setTintColor:[UIColor whiteColor]];
    [btn setBackgroundColor:[UIColor colorWithRed:0.0/255 green:169.0/255  blue:224.0/255 alpha:1.0f]];
    switch (indexPath.row) {
        case 0:
            cell.detail.text = @"";
            if ([cell.detail.text isEqualToString:@""]) {
                cell.add.hidden = NO;
                cell.edita.hidden = YES;
            }
            else{
                cell.add.hidden = YES;
                cell.edita.hidden = NO;
                       }
            cell.fill_kind.text = @"期望实习";
            [cell.add setTitle:@"添加期望实习" forState:UIControlStateNormal];
            [cell.add addTarget:self action:@selector(addbutton1) forControlEvents:UIControlEventTouchUpInside];
            [cell.edita addTarget:self action:@selector(addbutton1) forControlEvents:UIControlEventTouchUpInside];

            break;
        case 1:
            cell.detail.text = @"";
            if ([cell.detail.text isEqualToString:@""]) {
                cell.add.hidden = NO;
                cell.edita.hidden = YES;
            }
            else{
                cell.add.hidden = YES;
                cell.edita.hidden = NO;
            }
            cell.fill_kind.text = @"教育经历";
            [cell.add setTitle:@"添加教育经历" forState:UIControlStateNormal];
            [cell.add addTarget:self action:@selector(addbutton2) forControlEvents:UIControlEventTouchUpInside];
            [cell.edita addTarget:self action:@selector(addbutton2) forControlEvents:UIControlEventTouchUpInside];

            break;
           
        case 2:
            cell.detail.text = @"";
            if ([cell.detail.text isEqualToString:@""]) {
                cell.add.hidden = NO;
                cell.edita.hidden = YES;
            }
            else{
                cell.add.hidden = YES;
                cell.edita.hidden = NO;
            }
            cell.fill_kind.text = @"项目经验";
            [cell.add setTitle:@"添加项目经验" forState:UIControlStateNormal];
            [cell.add addTarget:self action:@selector(addbutton3) forControlEvents:UIControlEventTouchUpInside];
            [cell.edita addTarget:self action:@selector(addbutton3) forControlEvents:UIControlEventTouchUpInside];

            break;
        case 3:
            cell.detail.text = @"";
            if ([cell.detail.text isEqualToString:@""]) {
                cell.add.hidden = NO;
                cell.edita.hidden = YES;
            }
            else{
                cell.add.hidden = YES;
                cell.edita.hidden = NO;
            }
            cell.fill_kind.text = @"校园经历";
            [cell.add setTitle:@"添加校园经历" forState:UIControlStateNormal];
            [cell.add addTarget:self action:@selector(addbutton4) forControlEvents:UIControlEventTouchUpInside];
            [cell.edita addTarget:self action:@selector(addbutton4) forControlEvents:UIControlEventTouchUpInside];

            break;
        case 4:
            cell.detail.text = @"jhkhkhkhk";
            if ([cell.detail.text isEqualToString:@""]) {
                cell.add.hidden = NO;
                cell.edita.hidden = YES;
            }
            else{
                cell.add.hidden = YES;
                cell.edita.hidden = NO;
            }
            cell.fill_kind.text = @"实习经历";
            [cell.add setTitle:@"添加实习经历" forState:UIControlStateNormal];
            [cell.add addTarget:self action:@selector(addbutton6) forControlEvents:UIControlEventTouchUpInside];
            [cell.edita addTarget:self action:@selector(addbutton6) forControlEvents:UIControlEventTouchUpInside];
            
            break;
        case 5:
            
            cell.add.hidden = YES;
            cell.add.hidden = YES;
            cell.fill_kind.text = @"更多资料";
            cell.detail.text = @"";
            [cell addSubview:btn];
            [btn addTarget:self action:@selector(remind) forControlEvents:UIControlEventTouchUpInside];
            break;
               default:
            break;
    }
    // Configure the cell...
    
    return cell;
}

-(void)addbutton1{
    [self performSegueWithIdentifier:@"add_hope" sender:self];
}
-(void)addbutton2{
    [self performSegueWithIdentifier:@"add_education" sender:self];
}
-(void)addbutton3{
    [self performSegueWithIdentifier:@"add_project" sender:self];
}
-(void)addbutton4{
    [self performSegueWithIdentifier:@"add_school" sender:self];
}
-(void)addbutton5{
    [self performSegueWithIdentifier:@"add_skill" sender:self];
}
-(void)addbutton6{
    [self performSegueWithIdentifier:@"add_experience" sender:self];
}
-(void)remind{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提醒" message:@"更多资料请到网站上填写！" delegate:self cancelButtonTitle:@"返回" otherButtonTitles:nil];
    [alert show];
}
-(void)addbutton7{
    // 我的作品
    
}
-(void)addbutton8{
    [self performSegueWithIdentifier:@"add_descri" sender:self];
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
