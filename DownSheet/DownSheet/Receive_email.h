//
//  Receive_email.h
//  DownSheet
//
//  Created by 是 撒 on 5/18/15.
//  Copyright (c) 2015 wolf. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "work_cell.h"

@protocol EmailDelegate <NSObject>
@optional

-(void)didSelectIndex:(NSInteger)index text:(NSString*)text;

@end

@interface Receive_email : UIView<UITableViewDataSource,UITableViewDelegate,UIGestureRecognizerDelegate>{
    UILabel *title;
    UITableView *view;

}
-(id)initWithlist:(CGFloat)height kind:(NSString*)kind;
- (void)showInView:(UIViewController *)Sview;

@end
