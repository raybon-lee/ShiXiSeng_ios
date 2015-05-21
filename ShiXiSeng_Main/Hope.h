//
//  Hope.h
//  ShiXiSeng_Main
//
//  Created by 是 撒 on 5/20/15.
//  Copyright (c) 2015 jackson. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "test.h"
#import "Work_Day.h"
#import "DownSheet.h"
#import "CNPPopupController.h"

@interface Hope : UITableViewController<testDelegate,WorkDayDelegate,DownSheetDelegate,CNPPopupControllerDelegate>{
    NSArray *MenuList;
}

@property (nonatomic, strong) IBOutlet UIButton *city;
@property (nonatomic, strong)
IBOutlet UIButton *hope_day;
@property (nonatomic, strong)
IBOutlet UIButton *work_time;
@property (nonatomic, strong)
IBOutlet UIButton *job_kind;
@property (nonatomic, strong)
IBOutlet UIButton *job_time;
@property (nonatomic, strong)
IBOutlet UIButton *timeclick;
@property (nonatomic, strong)
NSString *kind;

@end
