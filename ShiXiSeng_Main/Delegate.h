//
//  Delegate.h
//  ShiXiSeng_Main
//
//  Created by 是 撒 on 15/5/3.
//  Copyright (c) 2015年 jackson. All rights reserved.
//


#import <Foundation/Foundation.h>

@class TestUsr;

@protocol Delegate <NSObject>

-(void)PassValue:(TestUsr *)value;

@end
