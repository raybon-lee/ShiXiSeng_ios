//
//  email.m
//  DownSheet
//
//  Created by 是 撒 on 5/18/15.
//  Copyright (c) 2015 wolf. All rights reserved.
//

#import "email.h"

@implementation email
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        
        _InfoLabel = [[UITextField alloc]init];
        _InfoLabel.backgroundColor = [UIColor clearColor];
        _InfoLabel.font = [UIFont systemFontOfSize:15];
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
    
    _InfoLabel.frame = CGRectMake(0, 0, ScreenWidth, 50);
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
