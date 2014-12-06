//
//  BaseModel.m
//  shanpai
//
//  Created by liang chunyan on 14-12-6.
//  Copyright (c) 2014年 BaiLing-ShanBo. All rights reserved.
//

#import "BaseModel.h"
#import <objc/runtime.h>

@interface BaseModel(BS)
/*!
 *  获取属性列表
 *
 *  @return 属性列表
 */
- (NSArray *)getPropertys;
@end

@implementation BaseModel

- (id)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if (self)
    {
        //自己属性列表
        NSArray *keys = [self getPropertys];
        //字典属性列表
        NSArray *dicKeys = [dictionary allKeys];
        
        __weak typeof(self) weakSelf = self;
        [dicKeys enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
            if ([keys containsObject:obj])
            {
                [weakSelf setValue:dictionary[obj] forKey:obj];
            }
        }];
        
    }
    return self;
}

- (NSArray *)getPropertys
{
    NSMutableArray *propertys = [[NSMutableArray alloc] init];
    
    unsigned int outCount, i;
    objc_property_t *properties = class_copyPropertyList([self class], &outCount);
    for (i=0; i<outCount; i++)
    {
        objc_property_t property = properties[i];
        NSString * key = [[NSString alloc]initWithCString:property_getName(property)  encoding:NSUTF8StringEncoding];
        [propertys addObject:key];
    }
    
    return propertys;
}

- (NSDictionary *)toDictionary
{
    NSMutableDictionary *dictionary = [[NSMutableDictionary alloc] init];
    
    //自己属性列表
    NSArray *keys = [self getPropertys];
    [keys enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        id value = [self valueForKey:obj];
        if (value != nil)
        {
            [dictionary setObject:value forKey:obj];
        }
    }];
    
    return dictionary;
}

@end
