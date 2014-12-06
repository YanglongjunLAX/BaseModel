//
//  BaseModel.h
//  shanpai
//
//  Created by liang chunyan on 14-12-6.
//  Copyright (c) 2014年 BaiLing-ShanBo. All rights reserved.
//  模板基类

#import <Foundation/Foundation.h>

@interface BaseModel : NSObject
/*!
 *  使用字典初始化
 *
 *  @param dictionary 字典
 *
 *  @return 结果
 */
- (id)initWithDictionary:(NSDictionary *)dictionary;
//获取字典形式：即属性和值对应起来的字典
- (NSDictionary *)toDictionary;

@end
