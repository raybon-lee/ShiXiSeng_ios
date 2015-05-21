//
//  job_sub_content.h
//  ShiXiSeng_Main
//
//  Created by 是 撒 on 5/19/15.
//  Copyright (c) 2015 jackson. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Work_Day.h"
#import "test.h"
#import "DownSheet.h"
#import "industry.h"

@interface job_sub_content : UITableViewController<WorkDayDelegate,DownSheetDelegate,testDelegate,industryDelegate>
{
        NSArray *MenuList;

    
}

@property (strong, nonatomic) IBOutlet UIButton *cycle;
@property (strong, nonatomic)
    IBOutlet UIButton *kind;
@property (strong, nonatomic)
    IBOutlet UIButton *location;
@property (strong, nonatomic)
IBOutlet UIButton *industry;
@property (strong, nonatomic)
NSString *kind1;

@end
