//
//  industry.m
//  collection_master
//
//  Created by 是 撒 on 5/18/15.
//  Copyright (c) 2015 芳仔小脚丫. All rights reserved.
//

#import "industry.h"

#import "industry_cell.h"



@implementation industry
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}
-(id)initWithlist:(CGFloat)height{
    /**
     *  绑定本地数据（行业领域）
     */
    //  读取本地资源文件保存数组
    NSString *fullpath=[[NSBundle mainBundle]pathForResource:@"industry.plist" ofType:nil];
    industry_kind = [NSArray arrayWithContentsOfFile:fullpath];
    self = [super init];
    if(self){
        self.frame = CGRectMake(0, 0, ScreenWidth, ScreenHeight);
        self.backgroundColor = RGBACOLOR(160, 160, 160, 0);
        title = [[UILabel alloc] initWithFrame:CGRectMake(0, ScreenHeight, ScreenWidth, 30)];
        [title setText:@"   行业领域"];
        title.font = [UIFont systemFontOfSize:12];
        [title setTextColor:[UIColor colorWithRed:0.0/255 green:161.0/255  blue:233.0/255 alpha:1.0f]];
        [title setBackgroundColor:[UIColor colorWithRed:222.0/255 green:251.0/255  blue:255.0/255 alpha:1.0f]];
        
        //  设置collectionview
        identifier = @"cell";
        
        // 初始化layout
        
        UICollectionViewFlowLayout * flowLayout =[[UICollectionViewFlowLayout alloc] init];
        
        [flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
        
        
        _collectionView =[[UICollectionView alloc] initWithFrame:CGRectMake(0, ScreenHeight, ScreenWidth, ScreenHeight/2)collectionViewLayout:flowLayout];
        
        [_collectionView setBackgroundColor:[UIColor whiteColor]];
        //注册单元格
        
        [_collectionView registerClass:[industry_cell class]forCellWithReuseIdentifier:identifier];
        

        
        //设置代理
        
        _collectionView.delegate = self;
        
        _collectionView.dataSource = self;
        
        //代码控制header和footer的显示
        UICollectionViewFlowLayout *collectionViewLayout = (UICollectionViewFlowLayout *)_collectionView.collectionViewLayout;
        collectionViewLayout.headerReferenceSize = CGSizeMake(ScreenWidth, 20);
        
        [self addSubview:title];
        [self addSubview:_collectionView];
        [self animeData];
        
    }
    return self;


}
-(void)animeData{
    //self.userInteractionEnabled = YES;
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tappedCancel)];
    [self addGestureRecognizer:tapGesture];
    tapGesture.delegate = (id)self;
    [UIView animateWithDuration:.25 animations:^{
        self.backgroundColor = RGBACOLOR(160, 160, 160, .4);
        [UIView animateWithDuration:.25 animations:^{
            [title setFrame:CGRectMake(title.frame.origin.x, (ScreenHeight-_collectionView.frame.size.height)-(title.frame.size.height)-40, title.frame.size.width, title.frame.size.height)];
            [_collectionView setFrame:CGRectMake(_collectionView.frame.origin.x, ScreenHeight-_collectionView.frame.size.height-40, _collectionView.frame.size.width, _collectionView.frame.size.height)];
            
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
        
        [_collectionView setFrame:CGRectMake(0, ScreenHeight, ScreenWidth, 0)];
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
        [Sview.view addSubview:self];
    }
}
#pragma mark - collectionView delegate

//设置分区



-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView

{
    
    
    return 1;
    
}
//每个分区上得元素个数

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section

{
    return industry_kind.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath

{
    
    NSUInteger row = [indexPath row];
    
    industry_cell * cell =[collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    [cell sizeToFit];
    [cell setIsAccessibilityElement:YES];
    cell.backgroundColor =[UIColor whiteColor];
    NSDictionary *rowDict = [industry_kind objectAtIndex:row];
    [cell.industry setText:[rowDict objectForKey:@"data"]];
    return cell;
}
//  设置点击事件
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
   
   
    industry_cell * cell = (industry_cell *)[collectionView cellForItemAtIndexPath:indexPath];
    NSLog(@"%@",cell.industry.text);

    if([_delegate respondsToSelector:@selector(didSelect:)]){
        NSLog(@"test111");
    }
    if(_delegate!=nil && [_delegate respondsToSelector:@selector(didSelect:)]){
        [_delegate didSelect:cell.industry.text];
        return;
    }//    if(cell.selected){
//        cell.industry.textColor = [UIColor colorWithRed:89.0/255 green:186.0/255  blue:239.0/255 alpha:1.0f];
//    }else{
//        //self.backgroundColor = [UIColor redColor];
//        
//        cell.industry.textColor = [UIColor blackColor];
//    }
    [self tappedCancel];
   
    
 
    
}
//设置元素的的大小框
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    
    UIEdgeInsets top = {0,0,0,0};
    return top;
}
// 定义上下cell的最小间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return 0;
}

// 定义左右cell的最小间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return 0;
}
//设置元素大小

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    
    
    return CGSizeMake(ScreenWidth/3, 45);
    
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
