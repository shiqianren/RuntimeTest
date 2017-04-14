//
//  Tool.h
//  RuntimeTest
//
//  Created by shiqianren on 2017/4/13.
//  Copyright © 2017年 shiqianren. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Tool : NSObject
+(instancetype)shareManager;

-(NSString *)chageMethod;
-(void) addCount;

@end
