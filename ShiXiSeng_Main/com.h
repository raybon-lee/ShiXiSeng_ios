//
//  com.h
//  ShiXiSeng_Main
//
//  Created by 是 撒 on 15/5/9.
//  Copyright (c) 2015年 jackson. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DAContextMenuCell;

@protocol DAContextMenuCellDelegate1 <NSObject>

- (void)contextMenuCellDidSelectMoreOption:(DAContextMenuCell *)cell;
- (void)contextMenuDidHideInCell:(DAContextMenuCell *)cell;
- (void)contextMenuDidShowInCell:(DAContextMenuCell *)cell;
- (void)contextMenuWillHideInCell:(DAContextMenuCell *)cell;
- (void)contextMenuWillShowInCell:(DAContextMenuCell *)cell;
- (BOOL)shouldShowMenuOptionsViewInCell:(DAContextMenuCell *)cell;
@optional
- (void)contextMenuCellDidSelectDeleteOption:(DAContextMenuCell *)cell;

@end


@interface com : UITableViewCell

@property (strong, nonatomic) IBOutlet UIImageView *comIcon;
@property (strong, nonatomic) IBOutlet UILabel *comName;
@property (strong, nonatomic) IBOutlet UILabel *detail;
@property (strong, nonatomic) IBOutlet UIButton *fix;
//  设置一个参数控制颜色和fix.title的变化
@property int temp;
-(IBAction)pressFix:(id)sender;


@property (strong, nonatomic) IBOutlet UIView *actualContentView;

@property (readonly, assign, nonatomic, getter = isContextMenuHidden) BOOL contextMenuHidden;
@property (strong, nonatomic) NSString *deleteButtonTitle;
@property (assign, nonatomic) BOOL editable;
@property (assign, nonatomic) CGFloat menuOptionButtonTitlePadding;
@property (assign, nonatomic) CGFloat menuOptionsAnimationDuration;
@property (assign, nonatomic) CGFloat bounceValue;
@property (strong, nonatomic) NSString *moreOptionsButtonTitle;

@property (weak, nonatomic) id<DAContextMenuCellDelegate1> delegate;

- (CGFloat)contextMenuWidth;
- (void)setMenuOptionsViewHidden:(BOOL)hidden animated:(BOOL)animated completionHandler:(void (^)(void))completionHandler;

@end
