//
//  testcell.m
//  collection_master
//
//  Created by 是 撒 on 5/18/15.
//  Copyright (c) 2015 芳仔小脚丫. All rights reserved.
//

#import "testcell.h"

@implementation testcell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _city = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 80, 20)];
        _city.text = @"成都";
        [_city setTextColor:[UIColor colorWithRed:153.0/255 green:153.0/255  blue:153.0/255 alpha:1.0f]];
        _city.textAlignment = NSTextAlignmentCenter;
        _city.font = [UIFont systemFontOfSize:12];
        _city.backgroundColor = [UIColor clearColor];

        [self addSubview:_city];
    }
    return self;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    NSLog(@"sdasdas");
    [self setSelected:selected animated:animated];
    if(selected){
        _city.textColor = [UIColor colorWithRed:89.0/255 green:186.0/255  blue:239.0/255 alpha:1.0f];
    }else{
        self.backgroundColor = [UIColor redColor];
        
        _city.textColor = [UIColor colorWithRed:153.0/255 green:153.0/255  blue:153.0/255 alpha:1.0f];
    }
}

@end
