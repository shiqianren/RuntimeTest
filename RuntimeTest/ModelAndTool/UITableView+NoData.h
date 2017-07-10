//
//  UITableView+NoData.h
//  RuntimeTest
//
//  Created by shiqianren on 2017/7/10.
//  Copyright © 2017年 shiqianren. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableView (NoData)
@property (nonatomic, assign) BOOL didLayout;
@property (nonatomic , strong) UIImage *noDataImage;
@property (nonatomic , strong) UIView *noDataView;

@end
