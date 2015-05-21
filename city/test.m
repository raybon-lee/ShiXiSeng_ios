
//
//  test.m
//  collection_master
//
//  Created by 是 撒 on 5/17/15.
//  Copyright (c) 2015 芳仔小脚丫. All rights reserved.
//

#import "test.h"
#import "testcell.h"
#import "CollectionHeadView.h"

#define RGBCOLOR(r, g, b)       [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:1]
#define RGBACOLOR(r, g, b, a)   [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:(a)]
//获取设备的物理高度
#define ScreenHeight [UIScreen mainScreen].bounds.size.height
//获取设备的物理宽度
#define ScreenWidth [UIScreen mainScreen].bounds.size.width
@interface test ()



@end

@implementation test

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
     *  绑定本地数据（热门城市）
     */
    //  读取本地资源文件保存数组
    NSString *fullpath=[[NSBundle mainBundle]pathForResource:@"hot_city.plist" ofType:nil];
    hot_city = [NSArray arrayWithContentsOfFile:fullpath];
    
    /**
     *  绑定本地数据（ABCDEF）
     */
    //  读取本地资源文件保存数组
    NSString *fullpath1=[[NSBundle mainBundle]pathForResource:@"ABCDEF_city.plist" ofType:nil];
    ABCDEF_city = [NSArray arrayWithContentsOfFile:fullpath1];
    
    /**
     *  绑定本地数据（GHIJ）
     */
    //  读取本地资源文件保存数组
    NSString *fullpath2=[[NSBundle mainBundle]pathForResource:@"GHIJ_city.plist" ofType:nil];
    GHIJ_city = [NSArray arrayWithContentsOfFile:fullpath2];
    
    /**
     *  绑定本地数据（KLMN）
     */
    //  读取本地资源文件保存数组
    NSString *fullpath3=[[NSBundle mainBundle]pathForResource:@"KLMN_city.plist" ofType:nil];
    KLMN_city = [NSArray arrayWithContentsOfFile:fullpath3];
    
    /**
     *  绑定本地数据（OPQR）
     */
    //  读取本地资源文件保存数组
    NSString *fullpath4=[[NSBundle mainBundle]pathForResource:@"OPQR_city.plist" ofType:nil];
    OPQR_city = [NSArray arrayWithContentsOfFile:fullpath4];
    
    /**
     *  绑定本地数据（STUV）
     */
    //  读取本地资源文件保存数组
    NSString *fullpath5=[[NSBundle mainBundle]pathForResource:@"STUV_city.plist" ofType:nil];
    STUV_city = [NSArray arrayWithContentsOfFile:fullpath5];
    
    /**
     *  绑定本地数据（WXYZ）
     */
    //  读取本地资源文件保存数组
    NSString *fullpath6=[[NSBundle mainBundle]pathForResource:@"WXYZ_city.plist" ofType:nil];
    WXYZ_city = [NSArray arrayWithContentsOfFile:fullpath6];
    
    
    self = [super init];
    if(self){
        self.frame = CGRectMake(0, 0, ScreenWidth, ScreenHeight);
        self.backgroundColor = RGBACOLOR(160, 160, 160, 0);
        title = [[UILabel alloc] initWithFrame:CGRectMake(0, ScreenHeight, ScreenWidth, 30)];
        [title setText:@"   城市"];
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
        
        [_collectionView registerClass:[testcell class]forCellWithReuseIdentifier:identifier];
        
        //collection头视图的注册
        [_collectionView registerClass:[CollectionHeadView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"head"];
        
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
    
    return 7;
    
}





//设置元素的的大小框

-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section

{
    
    UIEdgeInsets top = {30,15,30,15};
    
    return top;
    
}

//每个分区上得元素个数

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section

{
    switch (section) {
        case 0:
            return hot_city.count;
            break;
        case 1:
            return ABCDEF_city.count;
            break;
        case 2:
            return GHIJ_city.count;
            break;
        case 3:
            return KLMN_city.count;
            break;
        case 4:
            return OPQR_city.count;
            break;
        case 5:
            return STUV_city.count;
            break;
        case 6:
            return WXYZ_city.count;
            break;
        default:
            return 15;
            break;
    }
    
}



//设置元素内容

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath

{


    NSUInteger row = [indexPath row];
    

    
    testcell * cell =[collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    if(!cell.selected){
         cell.city.textColor = [UIColor blackColor];
    }
    [cell sizeToFit];
    [cell setIsAccessibilityElement:YES];
    cell.backgroundColor =[UIColor whiteColor];
  
        if(indexPath.section == 0){
        
              NSDictionary *rowDict = [hot_city objectAtIndex:row];
              [cell.city setText:[rowDict objectForKey:@"hot_city"]];
               return cell;
    }else if(indexPath.section == 1){
        NSDictionary *rowDict1 = [ABCDEF_city objectAtIndex:row];
        [cell.city setText:[rowDict1 objectForKey:@"hot_city"]];

        return cell;
    }else if(indexPath.section == 2){
        NSDictionary *rowDict2 = [GHIJ_city objectAtIndex:row];
        [cell.city setText:[rowDict2 objectForKey:@"hot_city"]];

        return cell;
    }else if(indexPath.section == 3){
        NSDictionary *rowDict3 = [KLMN_city objectAtIndex:row];
        [cell.city setText:[rowDict3 objectForKey:@"hot_city"]];

        return cell;
    }else if(indexPath.section == 4){
        NSDictionary *rowDict4 = [OPQR_city objectAtIndex:row];
        [cell.city setText:[rowDict4 objectForKey:@"hot_city"]];

        return cell;
    }else if(indexPath.section == 5){
        NSDictionary *rowDict5 = [STUV_city objectAtIndex:row];
        [cell.city setText:[rowDict5 objectForKey:@"hot_city"]];
        return cell;
    }else{
        NSDictionary *rowDict6 = [WXYZ_city objectAtIndex:row];
        [cell.city setText:[rowDict6 objectForKey:@"hot_city"]];
        return cell;
    }
    
    
}
//  设置点击事件
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
   
    testcell * cell = (testcell *)[collectionView cellForItemAtIndexPath:indexPath];
    NSLog(@"%@",cell.city.text);
   
    
    
    [self tappedCancel];


    if(_delegate!=nil && [_delegate respondsToSelector:@selector(didSelectIndex: city:)]){
        NSLog(@"city != nil");
        [_delegate didSelectIndex:indexPath.row city:cell.city.text];
        return;
    }

    
}

// 返回headview或footview
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        CollectionHeadView *headView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"head" forIndexPath:indexPath];
        [headView.label setTextColor:[UIColor lightGrayColor]];
        headView.label.text = @"    热门城市";
        return headView;
    }else if(indexPath.section == 1){
    CollectionHeadView *headView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"head" forIndexPath:indexPath];
    headView.label.text = @"    ABCDEF";
    [headView.label setTextColor:[UIColor lightGrayColor]];
        return headView;
    }else if (indexPath.section == 2){
        CollectionHeadView *headView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"head" forIndexPath:indexPath];
        headView.label.text = @"    GHIJ";
        [headView.label setTextColor:[UIColor lightGrayColor]];
        return headView;
    }else if (indexPath.section == 3){
        CollectionHeadView *headView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"head" forIndexPath:indexPath];
        headView.label.text = @"    KLMN";
        [headView.label setTextColor:[UIColor lightGrayColor]];
        return headView;
    }else if (indexPath.section == 4){
        CollectionHeadView *headView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"head" forIndexPath:indexPath];
        headView.label.text = @"    OPQR";
        [headView.label setTextColor:[UIColor lightGrayColor]];
        return headView;
    }else if (indexPath.section == 5){
        CollectionHeadView *headView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"head" forIndexPath:indexPath];
        headView.label.text = @"    STUV";
        [headView.label setTextColor:[UIColor lightGrayColor]];
        return headView;
    }else{
        CollectionHeadView *headView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"head" forIndexPath:indexPath];
        headView.label.text = @"    WXYZ";
        [headView.label setTextColor:[UIColor lightGrayColor]];
        return headView;
    }
    
}


//设置单元格宽度

//设置元素大小

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    
    
    return CGSizeMake(80, 20);
    
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
