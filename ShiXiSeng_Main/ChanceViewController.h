//
//  ChanceViewController.h
//  ShiXiSeng_Main
//
//  Created by 是 撒 on 15/5/4.
//  Copyright (c) 2015年 jackson. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DownSheet.h"

@interface ChanceViewController : UIViewController <UITableViewDelegate,UITableViewDataSource, DownSheetDelegate> {
    CGFloat w ;
    NSArray *MenuList;
    NSArray *MenuList1;
    NSArray *MenuList2;
}

@property (strong, nonatomic) NSString *kind1;
@property (strong, nonatomic) NSString *kind2;

@property(strong, nonatomic)UIBarButtonItem *job_kind;
@property(strong, nonatomic)UIBarButtonItem *location;
@property(strong, nonatomic)UIBarButtonItem *work_day;
@property(strong, nonatomic)UIBarButtonItem *salary_day;

@property (strong, nonatomic) UIButton *button;


@property(nonatomic, strong)UISearchBar *searchBar;

@property(nonatomic,strong)NSArray *job;

@property(strong,nonatomic) IBOutlet UITableView *tableview;



@end
