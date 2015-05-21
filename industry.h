//
//  industry.h
//  collection_master
//
//  Created by 是 撒 on 5/18/15.
//  Copyright (c) 2015 芳仔小脚丫. All rights reserved.
//

#import <UIKit/UIKit.h>
#define RGBCOLOR(r, g, b)       [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:1]
#define RGBACOLOR(r, g, b, a)   [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:(a)]
//获取设备的物理高度
#define ScreenHeight [UIScreen mainScreen].bounds.size.height
//获取设备的物理宽度
#define ScreenWidth [UIScreen mainScreen].bounds.size.width


@protocol industryDelegate<NSObject>

-(void)didSelect:(NSString*)industry;

@end

@interface industry : UIView<UICollectionViewDataSource,UICollectionViewDelegate>{
    
    NSString * identifier;
    
    UILabel *title;
    
    NSArray *industry_kind;
}

-(id)initWithlist:(CGFloat)height;
- (void)showInView:(UIViewController *)Sview;
@property(nonatomic, strong) UICollectionView *collectionView;
//  委托协议
@property(nonatomic,assign) id <industryDelegate> delegate;

@end
