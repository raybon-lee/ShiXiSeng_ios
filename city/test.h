//
//  test.h
//  collection_master
//
//  Created by 是 撒 on 5/17/15.
//  Copyright (c) 2015 芳仔小脚丫. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol testDelegate<NSObject>
-(void)didSelectIndex:(NSInteger)index city:(NSString*)city;
@end
@interface test : UIView<UICollectionViewDataSource,UICollectionViewDelegate>

{
//    UICollectionView *collectionView;
        NSString * identifier;
    
        UILabel *title;
    
        NSArray *hot_city;
        NSArray *ABCDEF_city;
        NSArray *GHIJ_city;
        NSArray *KLMN_city;
        NSArray *OPQR_city;
        NSArray *STUV_city;
        NSArray *WXYZ_city;
}

-(id)initWithlist:(CGFloat)height;
- (void)showInView:(UIViewController *)Sview;

@property(nonatomic,assign) id <testDelegate> delegate;
@property(nonatomic, strong) UICollectionView *collectionView;

@end
