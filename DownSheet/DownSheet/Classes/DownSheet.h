//
//  DownSheet.h
//  audioWriting
//
//  Created by wolf on 14-7-19.
//  Copyright (c) 2014年 wangruiyy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DownSheetCell.h"
@protocol DownSheetDelegate <NSObject>
@optional


-(void)didSelectIndex:(NSInteger)index text:(NSString*)text;

@end

@interface DownSheet : UIView<UITableViewDataSource,UITableViewDelegate,UIGestureRecognizerDelegate>{
    /**
     *   三级列表
     */
    NSArray *job_first;
    NSArray *job_second;
    NSArray *job_third;
    
    int flag;
    @public NSString *job;
    
    UILabel *title;
    UITableView *view;
    UITableView *view_second;
    UITableView *view_third;
    
    NSArray *listData;
    NSArray *listData1;
    NSInteger num;
}

-(id)initWithlist:(NSArray *)list height:(CGFloat)height;
- (void)showInView:(UIViewController *)Sview;
@property(nonatomic,assign) id <DownSheetDelegate> delegate;

@property (strong, nonatomic) NSMutableArray  *title_table;
@property (strong, nonatomic) NSMutableArray  *title_table_1;
@property (strong, nonatomic) NSMutableArray  *title_table_2;

@property (strong, nonatomic) NSString *msg;


@end

// 版权属于原作者
// http://code4app.com (cn) http://code4app.net (en)
// 发布代码于最专业的源码分享网站: Code4App.com 
