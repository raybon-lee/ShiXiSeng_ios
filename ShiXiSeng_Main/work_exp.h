//
//  work_exp.h
//  ShiXiSeng_Main
//
//  Created by 是 撒 on 5/20/15.
//  Copyright (c) 2015 jackson. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CNPPopupController.h"
@interface work_exp : UITableViewController<CNPPopupControllerDelegate>

@property (nonatomic, strong) IBOutlet UIButton *chosetime00;
@property (nonatomic, strong) IBOutlet UIButton *chosetim11;
@property int  _flag_;

@end
