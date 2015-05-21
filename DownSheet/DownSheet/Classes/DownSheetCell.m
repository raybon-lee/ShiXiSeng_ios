//
//  DownSheetCell.m
//  audioWriting
//
//  Created by wolf on 14-7-19.
//  Copyright (c) 2014年 wangruiyy. All rights reserved.
//

#import "DownSheetCell.h"

@implementation DownSheetCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code

        _InfoLabel = [[UILabel alloc]init];
        _InfoLabel.backgroundColor = [UIColor clearColor];
        _InfoLabel.font = [UIFont systemFontOfSize:12];
        //        [self.contentView addSubview:leftView];
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

    _InfoLabel.frame = CGRectMake(15, 0, 140, 40);
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
    // Configure the view for the selected state
}

@end

// 版权属于原作者
// http://code4app.com (cn) http://code4app.net (en)
// 发布代码于最专业的源码分享网站: Code4App.com 
