//
//  MsgCell.h
//  ShiXiSeng_Main
//
//  Created by 是 撒 on 15/5/9.
//  Copyright (c) 2015年 jackson. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MsgCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UILabel *jobname;
@property (strong, nonatomic)
    IBOutlet UILabel *companyname;
@property (strong, nonatomic)
    IBOutlet UILabel *way;
@property (strong, nonatomic)
    IBOutlet UILabel *date;
@property (strong, nonatomic)
    IBOutlet UILabel *suit;

@end
