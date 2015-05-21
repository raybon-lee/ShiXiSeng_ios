//
//  Personinfo.h
//  ShiXiSeng_Main
//
//  Created by 是 撒 on 15/5/8.
//  Copyright (c) 2015年 jackson. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Work_Day.h"
#import "CNPPopupController.h"


@interface Personinfo : UITableViewController <UINavigationControllerDelegate,WorkDayDelegate,CNPPopupControllerDelegate>{
    NSArray *MenuList;
}
@property (strong, nonatomic) NSString *kind;
@property (strong, nonatomic) IBOutlet UITextField *real_name;
@property (strong, nonatomic) IBOutlet UITextField *email;
@property (strong, nonatomic) IBOutlet UITextField *phone_number;
@property (strong, nonatomic) IBOutlet UIButton *study;
@property (strong, nonatomic) IBOutlet UIButton *chosetime;

@property int __flag_;

-(IBAction)save:(id)sender;

@end
