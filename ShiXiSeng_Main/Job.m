//  职位的数据模型
//  Job.m
//  ShiXiSeng_Main
//
//  Created by 是 撒 on 15/5/5.
//  Copyright (c) 2015年 jackson. All rights reserved.
//

#import "Job.h"

@implementation Job

//  实现job.h中的方法

-(instancetype)initWithDict:(NSDictionary *)dict{
    if(self = [super init]){
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

+(instancetype)jobInfoWithDict:(NSDictionary *)dict{
    return [[self alloc]initWithDict:dict];
}

@end
