//
//  workday.h
//  DownSheet
//
//  Created by 是 撒 on 5/18/15.
//  Copyright (c) 2015 wolf. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Work_Day.h"
#import "Receive_email.h"
@interface workday : UIViewController<WorkDayDelegate>{
    NSArray *MenuList;
    NSArray *MenuList1;
    NSArray *MenuList2;
    NSArray *MenuList3;
    NSArray *Menulist4;
    NSArray *MenuList5;
    
}

@property (strong, nonatomic) NSString *kind1;
@property (strong, nonatomic) NSString *kind2;
@property (strong, nonatomic) NSString *kind3;
@property (strong, nonatomic) NSString *kind4;
@property (strong, nonatomic) NSString *kind5;
@property (strong, nonatomic) NSString *kind6;

@property (strong, nonatomic) NSString *kind7;

@end
