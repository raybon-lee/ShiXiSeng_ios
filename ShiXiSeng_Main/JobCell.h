//
//  JobCell.h
//  ShiXiSeng_Main
//
//  Created by 是 撒 on 15/5/8.
//  Copyright (c) 2015年 jackson. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JobCell : UITableViewCell

//  声明在单元格内需要绑定的对象
@property(weak,nonatomic) IBOutlet UIImageView *companyIcon;
@property(weak,nonatomic) IBOutlet UILabel *date;
@property(weak,nonatomic) IBOutlet UILabel *salary;
@property(weak,nonatomic) IBOutlet UILabel *workday;
@property(weak,nonatomic) IBOutlet UILabel *location;
@property(weak,nonatomic) IBOutlet UILabel *companyName;
@property(weak,nonatomic) IBOutlet UILabel *job;

@end
