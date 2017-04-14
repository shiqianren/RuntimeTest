//
//  HGUser.m
//  RuntimeTest
//
//  Created by shiqianren on 2017/4/14.
//  Copyright © 2017年 shiqianren. All rights reserved.
//

#import "HGUser.h"

@implementation HGUser

-(NSString*)description{
    return [NSString stringWithFormat:@"%@--%@--%@--", _name, _age, _sex];
}


-(void)setValue:(id)value forUndefinedKey:(NSString *)key{
	if ([key isEqualToString:@"id"]){
		self.uid = value;
	}


}

@end
