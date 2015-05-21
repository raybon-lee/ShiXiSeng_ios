//
//  Education_exp.h
//  ShiXiSeng_Main
//
//  Created by 是 撒 on 5/20/15.
//  Copyright (c) 2015 jackson. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CNPPopupController.h"
#import "Work_Day.h"
@interface Education_exp : UITableViewController<CNPPopupControllerDelegate,WorkDayDelegate>{
    NSArray *menu;
}

@property (nonatomic, strong) IBOutlet UIButton *tim1;
@property (nonatomic, strong) IBOutlet UIButton *tim2;
@property (nonatomic, strong) IBOutlet UIButton *kind;

@property (nonatomic, strong) NSString *kind1;

@property int  _flag_;

@end
