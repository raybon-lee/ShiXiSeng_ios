//
//  industry_cell.m
//  collection_master
//
//  Created by 是 撒 on 5/18/15.
//  Copyright (c) 2015 芳仔小脚丫. All rights reserved.
//

#import "industry_cell.h"
//获取设备的物理高度
#define ScreenHeight [UIScreen mainScreen].bounds.size.height
//获取设备的物理宽度
#define ScreenWidth [UIScreen mainScreen].bounds.size.width
@implementation industry_cell
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
       
        down = [[UILabel alloc] initWithFrame:CGRectMake(0, 44.5, ScreenWidth/3, 0.5)];
             right = [[UILabel alloc] initWithFrame:CGRectMake((ScreenWidth/3)-0.5, 0, 0.5, 45)];
        
                down.text = @"";
        [down setBackgroundColor:[UIColor groupTableViewBackgroundColor]];
               right.text = @"";
        [right setBackgroundColor:[UIColor groupTableViewBackgroundColor]];
        
        _industry = [[UILabel alloc] initWithFrame:CGRectMake(0.5, 0.3, (ScreenWidth/3)-1, 44)];
        _industry.text = @"成都";
        [_industry setTextColor:[UIColor blackColor]];
        _industry.textAlignment = NSTextAlignmentCenter;
        _industry.font = [UIFont systemFontOfSize:12];
        _industry.backgroundColor = [UIColor clearColor];
        
   
        [self addSubview:down];

        [self addSubview:right];
        [self addSubview:_industry];
    }
    return self;
}


@end
