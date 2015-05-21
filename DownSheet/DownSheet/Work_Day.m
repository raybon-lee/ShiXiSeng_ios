//
//  Work_Day.m
//  DownSheet
//
//  Created by 是 撒 on 5/18/15.
//  Copyright (c) 2015 wolf. All rights reserved.
//

#import "Work_Day.h"
#import "work_cell.h"

@implementation Work_Day
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
-(id)initWithlist:(NSArray *)list height:(CGFloat)height kind:(NSString*)kind{
    _title_table = [[NSMutableArray alloc] init];

    
    /**
     *  实质上在传值的时候会有
     workday = list(解析json所得到的数组)
     在这里使用本地数据，所以只传已经从本地读完数据的的array
     */
    
    
    
    workday = list;
    
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
         装入具体信息的table
         */
        view = [[UITableView alloc]initWithFrame:CGRectMake(0, ScreenHeight, ScreenWidth, height) style:UITableViewStylePlain];
        view.scrollEnabled = YES;
        view.dataSource = self;
        view.delegate = self;
        
        [self addSubview:title];
        [self addSubview:view];
        [self animeData];
    }
        return self; 
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
            [title setFrame:CGRectMake(title.frame.origin.x, (ScreenHeight-title.frame.size.height)-(view.frame.size.height), title.frame.size.width, title.frame.size.height)];
            [view setFrame:CGRectMake(view.frame.origin.x, ScreenHeight-view.frame.size.height, view.frame.size.width, view.frame.size.height)];
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
        
        [view setFrame:CGRectMake(0, ScreenHeight, ScreenWidth, 0)];
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


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return workday.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSUInteger row = [indexPath row];
    NSDictionary *rowDict = [workday objectAtIndex:row];
    
    static NSString *CellIdentifier = @"Cell";
    work_cell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    [cell setcell:0.];
    if(cell==nil){
        cell = [[work_cell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        [cell setcell:0.];
    }
    
    cell.InfoLabel.text = [rowDict objectForKey:@"data"];
    [_title_table addObject:cell.InfoLabel.text];
    // Configure the cell...
    return cell;
}
/**
 *  设置每一行的高度
 *
 *  @param tableView <#tableView description#>
 *  @param indexPath <#indexPath description#>
 *
 *  @return <#return value description#>
 */
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 45.;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
   work_cell * cell = (work_cell *)[tableView cellForRowAtIndexPath:indexPath];

    test = cell.InfoLabel.text;
        NSLog(@"%@",test);
    if(_delegate!=nil && [_delegate respondsToSelector:@selector(didSelectIndex: text:)]){
        [_delegate didSelectIndex:indexPath.row text:test];
        return;
    }
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
