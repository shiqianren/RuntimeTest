//
//  Person.h
//  RuntimeTest
//
//  Created by shiqianren on 2017/4/13.
//  Copyright © 2017年 shiqianren. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject

@property(nonatomic,copy) NSString *name;
@property(nonatomic,copy) NSString *sex;
-(NSString *)sayName;
-(NSString *)saySex;
@end
