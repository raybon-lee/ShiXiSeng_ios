//
//  time_window.h
//  DownSheet
//
//  Created by 是 撒 on 5/18/15.
//  Copyright (c) 2015 wolf. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface time_window : UIView{
    /**
     *  标题
     */
    UILabel *title;
    /**
     *  总容器
     */
    UIView *main;
    /**
     *  时间容器
     */
    UIDatePicker *datepicker;
    /**
     *  确定按钮
     */
    UIButton *btn;
    /**
     取消按钮
     */
    UIButton *cancel;
    /**
     label(边框)
     */
    UILabel *label;
}
-(id)initWithlist:(NSString*)kind;
- (void)showInView:(UIViewController *)Sview;
@end
