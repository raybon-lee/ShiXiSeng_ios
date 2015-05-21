//
//  Work_Day.h
//  DownSheet
//
//  Created by 是 撒 on 5/18/15.
//  Copyright (c) 2015 wolf. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "work_cell.h"

@protocol WorkDayDelegate <NSObject>
@optional

-(void)didSelectIndex:(NSInteger)index text:(NSString*)text;

@end

@interface Work_Day : UIView<UITableViewDataSource,UITableViewDelegate,UIGestureRecognizerDelegate>{
    NSArray *workday;
    UILabel *title;
    UITableView *view;
@public NSString*test;
}

-(id)initWithlist:(NSArray *)list height:(CGFloat)height kind:(NSString*)kind;
- (void)showInView:(UIViewController *)Sview;
@property(nonatomic,assign) id <WorkDayDelegate> delegate;
@property (strong, nonatomic) NSMutableArray  *title_table;
@property (strong, nonatomic) NSString *msg;

@end
