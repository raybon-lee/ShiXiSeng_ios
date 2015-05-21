//
//  DownSheet.m
//  audioWriting
//
//  Created by wolf on 14-7-19.
//  Copyright (c) 2014年 wangruiyy. All rights reserved.
//

#import "DownSheet.h"


@implementation DownSheet

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

-(id)initWithlist:(NSArray *)list height:(CGFloat)height{
    
    _title_table = [[NSMutableArray alloc] init];

    
    /**
     *  绑定本地数据（第一级列表）
     */
    //  读取本地资源文件保存数组
    NSString *fullpath=[[NSBundle mainBundle]pathForResource:@"job_first.plist" ofType:nil];
    job_first = [NSArray arrayWithContentsOfFile:fullpath];
    
    NSLog(@"%@", job_first);
    NSLog(@"一级列表本地数据已加载!");
    /**
     *  绑定本地数据（第二级列表）
     */
    NSString *fullpath_0=[[NSBundle mainBundle]pathForResource:@"job_second(0).plist" ofType:nil];
    job_second = [NSArray arrayWithContentsOfFile:fullpath_0];
    
    NSLog(@"%@", job_second);
    NSLog(@"二级列表本地数据已加载!");
    
    /**
     *  绑定本地数据（第三级列表）
     */
    NSString *fullpath_0_0=[[NSBundle mainBundle]pathForResource:@"job_third(0).plist" ofType:nil];
    job_third = [NSArray arrayWithContentsOfFile:fullpath_0_0];
    NSLog(@"%@", job_third);
    NSLog(@"三级列表本地数据已加载");
    
    num = 1;
    self = [super init];
    if(self){
        self.frame = CGRectMake(0, 0, ScreenWidth, ScreenHeight);
        self.backgroundColor = RGBACOLOR(160, 160, 160, 0);
        title = [[UILabel alloc] initWithFrame:CGRectMake(0, ScreenHeight, ScreenWidth, 30)];
        [title setText:@"   职业类别"];
         title.font = [UIFont systemFontOfSize:12];
        [title setTextColor:[UIColor colorWithRed:0.0/255 green:161.0/255  blue:233.0/255 alpha:1.0f]];
        [title setBackgroundColor:[UIColor colorWithRed:222.0/255 green:251.0/255  blue:255.0/255 alpha:1.0f]];
        
        view = [[UITableView alloc]initWithFrame:CGRectMake(0, ScreenHeight, (2*ScreenWidth)/5, ScreenHeight/2) style:UITableViewStylePlain];
        view.scrollEnabled = YES;
        view.dataSource = self;
        view.delegate = self;
        
        view_second = [[UITableView alloc]initWithFrame:CGRectMake((2*ScreenWidth)/5, ScreenHeight, ScreenWidth/5, ScreenHeight/2) style:UITableViewStylePlain];
        view_second.scrollEnabled = YES;
        view_second.dataSource = self;
        view_second.delegate = self;
        
        view_third = [[UITableView alloc]initWithFrame:CGRectMake((3*ScreenWidth)/5, ScreenHeight, (2*ScreenWidth)/5, ScreenHeight/2) style:UITableViewStylePlain];
        view_third.scrollEnabled = YES;
        view_third.dataSource = self;
        view_third.delegate = self;
        
        [self addSubview:title];
        [self addSubview:view];
        [self addSubview:view_second];
        [self addSubview:view_third];
        [self animeData];
        
    }
    return self;
}

-(void)animeData{
    //self.userInteractionEnabled = YES;
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tappedCancel)];
    [self addGestureRecognizer:tapGesture];
    tapGesture.delegate = self;
    [UIView animateWithDuration:.25 animations:^{
        self.backgroundColor = RGBACOLOR(160, 160, 160, .4);
        [UIView animateWithDuration:.25 animations:^{
            [title setFrame:CGRectMake(title.frame.origin.x, (ScreenHeight-title.frame.size.height)-(view.frame.size.height)-40, title.frame.size.width, title.frame.size.height)];
            [view setFrame:CGRectMake(view.frame.origin.x, ScreenHeight-view.frame.size.height-40, view.frame.size.width, view.frame.size.height)];
            [view_second setFrame:CGRectMake(view_second.frame.origin.x, ScreenHeight-view_second.frame.size.height-40, view_second.frame.size.width, view_second.frame.size.height)];
            [view_third setFrame:CGRectMake(view_third.frame.origin.x,ScreenHeight-view_third.frame.size.height-40,view_third.frame.size.width, view_third.frame.size.height)];
            }];
    } completion:^(BOOL finished) {
    }];
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch{
    if([touch.view isKindOfClass:[self class]]){
        return YES;
    }
    return NO;
}

-(void)tappedCancel{                   
    [UIView animateWithDuration:.25 animations:^{
        
        [view setFrame:CGRectMake(0, ScreenHeight, (2*ScreenWidth)/5, 0)];
        [view_second setFrame:CGRectMake((2*ScreenWidth)/5, ScreenHeight, ScreenWidth/5, 0)];
        [view_third setFrame:CGRectMake((3*ScreenWidth)/5, ScreenHeight, (2*ScreenWidth)/5, 0)];
        [title setFrame:CGRectMake(0, ScreenHeight, ScreenHeight, 0)];
        
        self.alpha = 0;
    } completion:^(BOOL finished) {
        if (finished) {
            [self removeFromSuperview];
        }
    }];
}

- (void)showInView:(UIViewController *)Sview
{
    if(Sview==nil){
        [[UIApplication sharedApplication].delegate.window.rootViewController.view addSubview:self];
    }else{
    //[view addSubview:self];
        [Sview.view addSubview:self];
    }
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    if (tableView == view) {
      //  _title_table = [[NSMutableArray alloc] init];
        return job_first.count;
        
    }
    else if(tableView == view_second){

        _title_table_1 = [[NSMutableArray alloc] init];
        return job_second.count;
    }
    else{
        _title_table_2 = [[NSMutableArray alloc] init];
        return job_third.count;
    }
    
}
/**
 *  设置每一行数据
 *
 *  @param tableView <#tableView description#>
 *  @param indexPath <#indexPath description#>
 *
 *  @return <#return value description#>
 */
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
   
    if (tableView == view) {
       
        NSUInteger row = [indexPath row];
        NSDictionary *rowDict = [job_first objectAtIndex:row];
        
        static NSString *CellIdentifier = @"Cell";
        DownSheetCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        
        [cell setcell:0.];
        if(cell==nil){
            cell = [[DownSheetCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
            [cell setcell:0.];
        }

        cell.InfoLabel.text = [rowDict objectForKey:@"first_kind"];
        [_title_table addObject:cell.InfoLabel.text];
        // Configure the cell...
        return cell;
    }else if(tableView == view_second){

        NSUInteger row = [indexPath row];
        NSDictionary *rowDict = [job_second objectAtIndex:row];
        
        static NSString *CellIdentifier = @"Cell";
        DownSheetCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        [cell setcell:0.];
        if(cell==nil){
            [cell setcell:0.];
            cell = [[DownSheetCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        }
        cell.InfoLabel.text = [rowDict objectForKey:@"second_kind"];
        [_title_table_1 addObject:cell.InfoLabel.text];

        // Configure the cell...
        return cell;

    }else{
        NSUInteger row = [indexPath row];
        NSDictionary *rowDict = [job_third objectAtIndex:row];
        
        static NSString *CellIdentifier = @"Cell";
        DownSheetCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        [cell setcell:0.];
        if(cell==nil){
            [cell setcell:0.];
            cell = [[DownSheetCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        }
        
        cell.InfoLabel.text = [rowDict objectForKey:@"third_kind"];
        [_title_table_2 addObject:cell.InfoLabel.text];
     
        
        // Configure the cell...
        return cell;

    }
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 40.;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    

        
        DownSheetCell * cell = (DownSheetCell *)[tableView cellForRowAtIndexPath:indexPath];
        NSLog(@"%@",cell.InfoLabel.text);

  
    
    
    if (tableView == view) {
        /**
         *  二级菜单
         *
         *  @param 0 í
         *
         *  @return <#return value description#>
         */
        NSString *fullpath_0=[[NSBundle mainBundle]pathForResource:@"job_second(0).plist" ofType:nil];
        NSString *fullpath_1=[[NSBundle mainBundle]pathForResource:@"job_second(1).plist" ofType:nil];
        NSString *fullpath_2=[[NSBundle mainBundle]pathForResource:@"job_second(2).plist" ofType:nil];
        NSString *fullpath_3=[[NSBundle mainBundle]pathForResource:@"job_second(3).plist" ofType:nil];
        NSString *fullpath_4=[[NSBundle mainBundle]pathForResource:@"job_second(4).plist" ofType:nil];
        NSString *fullpath_5=[[NSBundle mainBundle]pathForResource:@"job_second(5).plist" ofType:nil];
        NSString *fullpath_6=[[NSBundle mainBundle]pathForResource:@"job_second(6).plist" ofType:nil];
        NSString *fullpath_7=[[NSBundle mainBundle]pathForResource:@"job_second(7).plist" ofType:nil];
        NSString *fullpath_8=[[NSBundle mainBundle]pathForResource:@"job_second(8).plist" ofType:nil];
        NSString *fullpath_9=[[NSBundle mainBundle]pathForResource:@"job_second(9).plist" ofType:nil];
        NSString *fullpath_10=[[NSBundle mainBundle]pathForResource:@"job_second(10).plist" ofType:nil];
        _msg = [_title_table objectAtIndex:(indexPath.row)];
        num = indexPath.row;
        switch (num) {
            case 1:
                job_second = [NSArray arrayWithContentsOfFile:fullpath_1];
                flag = 1;
                break;
            case 2:
                job_second = [NSArray arrayWithContentsOfFile:fullpath_2];
                flag = 2;
                break;
            case 3:
                job_second = [NSArray arrayWithContentsOfFile:fullpath_3];
                flag = 3;
                break;
            case 4:
                job_second = [NSArray arrayWithContentsOfFile:fullpath_4];
                flag = 4;
                break;
            case 5:
                job_second = [NSArray arrayWithContentsOfFile:fullpath_5];
                flag = 5;
                break;
            case 6:
                job_second = [NSArray arrayWithContentsOfFile:fullpath_6];
                flag = 6;
                break;
            case 7:
                job_second = [NSArray arrayWithContentsOfFile:fullpath_7];
                flag = 7;
                break;
            case 8:
                job_second = [NSArray arrayWithContentsOfFile:fullpath_8];
                flag = 8;
                break;
            case 9:
                job_second = [NSArray arrayWithContentsOfFile:fullpath_9];
                flag = 9;
                break;
            case 10:
                job_second = [NSArray arrayWithContentsOfFile:fullpath_10];
                flag = 10;
                break;
            default:
                job_second = [NSArray arrayWithContentsOfFile:fullpath_0];
                flag = 0;
                break;
        }
        [view_second reloadData];
    
    // [self tappedCancel];
    }else if(tableView == view_second){
        /**
         *  三级菜单
         */
        NSString *fullpath_0=[[NSBundle mainBundle]pathForResource:@"job_third(0).plist" ofType:nil];
        NSString *fullpath_1=[[NSBundle mainBundle]pathForResource:@"job_third(1).plist" ofType:nil];
        NSString *fullpath_2=[[NSBundle mainBundle]pathForResource:@"job_third(2).plist" ofType:nil];


        NSLog(@"%@",[_title_table_1 objectAtIndex:(indexPath.row)]);
        NSLog(@"Flag = %d", flag);
        if (flag == 1) {
             NSLog(@"%ld", (long)indexPath.row);
            
            switch (indexPath.row) {
                case 0:
                    job_third = [NSArray arrayWithContentsOfFile:fullpath_1];
                    break;
                 case 1:
                    job_third = [NSArray arrayWithContentsOfFile:fullpath_2];
                    break;
                default:
                    job_third = [NSArray arrayWithContentsOfFile:fullpath_0];
                     _msg = [_title_table_1 objectAtIndex:(indexPath.row)];
                    [self tappedCancel];
                    break;
            }
        }
        [view_third reloadData];
    }else{
        
        NSLog(@"%@",[_title_table_2 objectAtIndex:(indexPath.row)]);
        _msg = [_title_table_2 objectAtIndex:(indexPath.row)];
        [self tappedCancel];
    }
    
    
    if(_delegate!=nil && [_delegate respondsToSelector:@selector(didSelectIndex: text:)]){
        [_delegate didSelectIndex:indexPath.row text:_msg];
        return;
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end

// 版权属于原作者
// http://code4app.com (cn) http://code4app.net (en)
// 发布代码于最专业的源码分享网站: Code4App.com 
