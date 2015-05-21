//
//  work_cell.m
//  DownSheet
//
//  Created by 是 撒 on 5/18/15.
//  Copyright (c) 2015 wolf. All rights reserved.
//

#import "work_cell.h"

@implementation work_cell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        
        _InfoLabel = [[UILabel alloc]init];
        _InfoLabel.backgroundColor = [UIColor clearColor];
        _InfoLabel.font = [UIFont systemFontOfSize:12];
        [_InfoLabel setTextColor:[UIColor colorWithRed:153.0/255 green:153.0/255  blue:153.0/255 alpha:1.0f]];
        [self.contentView addSubview:_InfoLabel];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
    }
    return self;
}

-(void)setcell:(CGFloat)x{
    _InfoLabel.frame = CGRectMake(x, 0, 140, 40);
}

-(void)layoutSubviews{
    [super layoutSubviews];
    
    _InfoLabel.frame = CGRectMake(15, 0, 140, 45);
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    if(selected){
        _InfoLabel.textColor = [UIColor colorWithRed:89.0/255 green:186.0/255  blue:239.0/255 alpha:1.0f];
    }else{
        self.backgroundColor = [UIColor whiteColor];
        
        _InfoLabel.textColor = [UIColor blackColor];
    }
}


@end
