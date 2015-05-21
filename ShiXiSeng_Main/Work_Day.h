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

-(void)didSelectIndex:(NSInteger)index days:(NSString*)days;
-(void)didSelectIndex:(NSInteger)index money:(NSString*)money;
-(void)didSelectIndex:(NSInteger)index cycle:(NSString*)cycle;
-(void)didSelectIndex:(NSInteger)index study:(NSString *)study;
-(void)didSelectIndex:(NSInteger)index workday:(NSString *)workday;
-(void)didSelectIndex:(NSInteger)index skill:(NSString *)skill;


@end

@interface Work_Day : UIView<UITableViewDataSource,UITableViewDelegate,UIGestureRecognizerDelegate>{
    NSArray *workday;
    UILabel *title;
    UITableView *view;
}

-(id)initWithlist:(NSArray *)list height:(CGFloat)height kind:(NSString*)kind flag:(int)flag;
- (void)showInView:(UIViewController *)Sview;
@property(nonatomic,assign) id <WorkDayDelegate> delegate;
@property (strong, nonatomic) NSMutableArray  *title_table;
@property (strong, nonatomic) NSString *msg;
@property int flag_;

@end
