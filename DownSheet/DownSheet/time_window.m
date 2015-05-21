
//  time_window.m
//  DownSheet
//
//  Created by 是 撒 on 5/18/15.
//  Copyright (c) 2015 wolf. All rights reserved.
//

#import "time_window.h"
#define RGBCOLOR(r, g, b)       [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:1]
#define RGBACOLOR(r, g, b, a)   [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:(a)]
//获取设备的物理高度
#define ScreenHeight [UIScreen mainScreen].bounds.size.height
//获取设备的物理宽度
#define ScreenWidth [UIScreen mainScreen].bounds.size.width


@implementation time_window

/**
 *   初始化方法
 *
 *  @param frame <#frame description#>
 *
 *  @return <#return value description#>
 */
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}
/**
 *  程序调用入口
 *
 *  @param list   <#list description#>
 *  @param height <#height description#>
 *
 *  @return <#return value description#>
 */
-(id)initWithlist:(NSString*)kind{
   
    self = [super init];
    if(self){
        self.frame = CGRectMake(0, 0, ScreenWidth, ScreenHeight);
        self.backgroundColor = RGBACOLOR(160, 160, 160, 0);
        title = [[UILabel alloc] initWithFrame:CGRectMake(0, ScreenHeight, ScreenWidth, 30)];
        [title setText:kind];
        title.font = [UIFont systemFontOfSize:12];
        [title setTextColor:[UIColor colorWithRed:0.0/255 green:161.0/255  blue:233.0/255 alpha:1.0f]];
        [title setBackgroundColor:[UIColor colorWithRed:222.0/255 green:251.0/255  blue:255.0/255 alpha:1.0f]];
        
       
        /**
         选择时间的timepicker
         
         :returns: <#return value description#>
         */
        datepicker=[[UIDatePicker alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
        datepicker.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"zh_CN"];
        /**
         *  年月日显示
         */
        datepicker.datePickerMode = UIDatePickerModeDate;
        /**
         *  上午/下午 小时显示
         */
        //datepicker.datePickerMode = UIDatePickerModeTime;
        datepicker.backgroundColor=[UIColor whiteColor];
        NSDate *defaulDate=[NSDate dateWithTimeIntervalSinceNow:9000000];
        [datepicker setDate:defaulDate];
        datepicker.frame=CGRectMake(0, ScreenHeight, ScreenWidth, (ScreenHeight/3)-25);
        
        
        label = [[UILabel alloc] initWithFrame:CGRectMake(0, ScreenHeight, ScreenWidth, 1)];
        [label setBackgroundColor:[UIColor grayColor]];
        
        btn = [[UIButton alloc] initWithFrame:CGRectMake((ScreenWidth/2)+0.5, ScreenHeight, (ScreenWidth/2)-0.5, 24)];
        [btn setTitle:@"完成" forState:UIControlStateNormal];
        [btn.titleLabel setFont:[UIFont systemFontOfSize:12]];
        [btn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [btn setBackgroundColor:[UIColor whiteColor]];
        [btn addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
       
        cancel = [[UIButton alloc] initWithFrame:CGRectMake(0, ScreenHeight, (ScreenWidth/2)-0.5, 24)];
        [cancel setTitle:@"取消" forState:UIControlStateNormal];
        [cancel.titleLabel setFont:[UIFont systemFontOfSize:12]];
        [cancel setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        [cancel setBackgroundColor:[UIColor whiteColor]];
        [cancel addTarget:self action:@selector(cancelClicked:) forControlEvents:UIControlEventTouchUpInside];
        
        [self addSubview:label];
        [self addSubview:datepicker];
        [self addSubview:btn];
        [self addSubview:cancel];
        [self addSubview:title];

        [self animeData];
    }
    return self;
}
-(IBAction)buttonClicked:(id)sender

{
    NSDate *selected = [datepicker date];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    /**
     *  年月日输出
     */
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    /**
     *  小时／分钟
     */
    //[dateFormatter setDateFormat:@"HH:mm"];
    NSString *destDateString = [dateFormatter stringFromDate:selected];
    
     NSLog(@"%@",destDateString);
    [self tappedCancel];
}
-(IBAction)cancelClicked:(id)sender

{
    [self tappedCancel];
}

/**
 *  弹出动画
 */
-(void)animeData{
    //self.userInteractionEnabled = YES;
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tappedCancel)];
    [self addGestureRecognizer:tapGesture];
    tapGesture.delegate = self;
    [UIView animateWithDuration:.25 animations:^{
        self.backgroundColor = RGBACOLOR(160, 160, 160, .4);
        [UIView animateWithDuration:.25 animations:^{
            [title setFrame:CGRectMake(title.frame.origin.x, (ScreenHeight-title.frame.size.height)-(datepicker.frame.size.height), title.frame.size.width, title.frame.size.height)];
            [datepicker setFrame:CGRectMake(datepicker.frame.origin.x, (ScreenHeight-datepicker.frame.size.height)-25, datepicker.frame.size.width, datepicker.frame.size.height)];
            [btn setFrame:CGRectMake(btn.frame.origin.x, ScreenHeight-btn.frame.size.height, btn.frame.size.width, btn.frame.size.height)];
             [cancel setFrame:CGRectMake(cancel.frame.origin.x, ScreenHeight-cancel.frame.size.height, cancel.frame.size.width, cancel.frame.size.height)];
            [label setFrame:CGRectMake(label.frame.origin.x, ScreenHeight-label.frame.size.height, label.frame.size.width, label.frame.size.height)];
        }];
    } completion:^(BOOL finished) {
    }];
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch{
    if([touch.view isKindOfClass:[self class]]){
        return YES;
    }
    return NO;
}

-(void)tappedCancel{
    [UIView animateWithDuration:.25 animations:^{
        [label setFrame:CGRectMake(0, ScreenHeight, ScreenWidth, 0)];
        [cancel setFrame:CGRectMake(0, ScreenHeight, cancel.frame.size.width, 0)];
        [btn setFrame:CGRectMake(0, ScreenHeight, btn.frame.size.width, 0)];
        [datepicker setFrame:CGRectMake(0, ScreenHeight, ScreenWidth, 0)];
        [title setFrame:CGRectMake(0, ScreenHeight, ScreenHeight, 0)];
        
        self.alpha = 0;
    } completion:^(BOOL finished) {
        if (finished) {
            [self removeFromSuperview];
        }
    }];
}

- (void)showInView:(UIViewController *)Sview
{
    if(Sview==nil){
        [[UIApplication sharedApplication].delegate.window.rootViewController.view addSubview:self];
    }else{
        //[view addSubview:self];
        [Sview.view addSubview:self];
    }
}

@end
