//
//  School_exp.h
//  ShiXiSeng_Main
//
//  Created by 是 撒 on 5/20/15.
//  Copyright (c) 2015 jackson. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Work_Day.h"

@interface School_exp : UITableViewController<WorkDayDelegate>{
    NSArray *MenuList;
}
@property (strong, nonatomic) NSString *kind;
@property (strong, nonatomic) IBOutlet UIButton *btn;
@end
