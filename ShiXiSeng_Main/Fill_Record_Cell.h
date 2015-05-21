//
//  Fill_Record_Cell.h
//  ShiXiSeng_Main
//
//  Created by 是 撒 on 5/14/15.
//  Copyright (c) 2015 jackson. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Fill_Record_Cell : UITableViewCell

@property (strong, nonatomic) IBOutlet UILabel *fill_kind;
@property (strong, nonatomic) IBOutlet UIButton *add;
@property (strong, nonatomic) IBOutlet UIButton *edita;
@property (strong, nonatomic) IBOutlet UITextView *detail;

-(IBAction)press:(id)sender;

@end
