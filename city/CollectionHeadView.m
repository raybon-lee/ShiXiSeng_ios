//
//  CollectionHeadView.m
//  collection_master
//
//  Created by 是 撒 on 5/17/15.
//  Copyright (c) 2015 芳仔小脚丫. All rights reserved.
//

#import "CollectionHeadView.h"

@implementation CollectionHeadView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _label1 = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 320, 0.5)];
        _label1.text = @"";
        [_label1 setBackgroundColor:[UIColor groupTableViewBackgroundColor]];
        
        _label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0.5, 320, 29)];
        _label.text = @"This is HeadView";
        _label.textAlignment = NSTextAlignmentLeft;
        _label.font = [UIFont systemFontOfSize:10];
        _label.backgroundColor = [UIColor whiteColor];
        
        _label2 = [[UILabel alloc] initWithFrame:CGRectMake(0, 29.5, 320, 0.5)];
        _label2.text = @"";
        [_label2 setBackgroundColor:[UIColor groupTableViewBackgroundColor]];

        [self addSubview:_label2];
        [self addSubview:_label1];
        [self addSubview:_label];
    }
    return self;
}

@end
