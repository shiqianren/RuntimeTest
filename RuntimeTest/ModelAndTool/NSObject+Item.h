//
//  NSObject+Item.h
//  RuntimeTest
//
//  Created by shiqianren on 2017/4/14.
//  Copyright © 2017年 shiqianren. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ModelDelegate<NSObject>

@optional
//提供一个协议，提供数组转模型
//用在三级数组转换
+(NSDictionary *)arrayContainModelClass;


@end
@interface NSObject (Item)
//字典转模型
+(instancetype)objectWithDict:(NSDictionary *)dict;


@end
