//  职位的数据模型
//  Job.h
//  ShiXiSeng_Main
//
//  Created by 是 撒 on 15/5/5.
//  Copyright (c) 2015年 jackson. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Job : NSObject

//  声明需要存读的数据属性
@property(nonatomic,copy) NSString *icon;
@property(nonatomic,copy) NSString *date;
@property(nonatomic,copy) NSString *salary;
@property(nonatomic,copy) NSString *workday;
@property(nonatomic,copy) NSString *location;
@property(nonatomic,copy) NSString *company;
@property(nonatomic,copy) NSString *job;

-(instancetype)initWithDict:(NSDictionary *)dict;
+(instancetype)jobInfoWithDict:(NSDictionary *)dict;

@end
