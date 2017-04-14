//
//  Movie.h
//  RuntimeTest
//
//  Created by shiqianren on 2017/4/14.
//  Copyright © 2017年 shiqianren. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HGUser.h"
#import "NSObject+Item.h"
@interface Movie : NSObject<NSCoding,ModelDelegate>
@property (nonatomic, strong) HGUser * user;
@property (nonatomic, copy) NSString *movieId;
@property (nonatomic, copy) NSString *movieName;
@property (nonatomic, copy) NSString *pic_url;
@end
