//
//  UITableView+NoData.m
//  RuntimeTest
//
//  Created by shiqianren on 2017/7/10.
//  Copyright © 2017年 shiqianren. All rights reserved.
//

#import "UITableView+NoData.h"
#import <objc/runtime.h>

static char NoDataViewKey;
static char NoDataImageKey;
static char DidLayoutKey;
@implementation UITableView (NoData)


+(void)load{
	  Class myclass = [self class];
	//reload method
	Method reloadMethod = class_getInstanceMethod(myclass, @selector(reloadData));
	//nodata method reload
	Method noDataReloadMethod = class_getInstanceMethod(myclass, @selector(noDataReload));
	//交换方法
	method_exchangeImplementations(reloadMethod, noDataReloadMethod);
	//  hook reload方法
	Method layoutMethod = class_getInstanceMethod([UITableView class], @selector(layoutSubviews));
	// 获取xmg_imageNamed
	Method noDataLayoutMethod = class_getInstanceMethod([UITableView class], @selector(noDataLayoutSubviews));
	
	// 交互方法:runtime
	method_exchangeImplementations(layoutMethod, noDataLayoutMethod);
}
- (BOOL)didLayout
{
	return objc_getAssociatedObject(self, &DidLayoutKey);
}

- (void)setDidLayout:(BOOL)didLayout
{
	objc_setAssociatedObject(self, &DidLayoutKey, @(didLayout), OBJC_ASSOCIATION_ASSIGN);
}
-(UIImage*)noDataImage{
	return objc_getAssociatedObject(self, &NoDataImageKey);
}

-(void)setNoDataImage:(UIImage *)noDataImage{
	objc_setAssociatedObject(self, &NoDataImageKey, noDataImage, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(UIView*)noDataView{

	return objc_getAssociatedObject(self, &NoDataViewKey);
}

-(void)setNoDataView:(UIView *)noDataView{
	objc_setAssociatedObject(self, &NoDataViewKey, noDataView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}


-(void)noDataReload{
	//必须要调用自己
	[self noDataReload];
	//if (self.didLayout)
	//{
	dispatch_async(dispatch_get_main_queue(), ^{
		
		NSInteger numberSection = self.numberOfSections;
		NSInteger zeroRow = 0;
		for (int i =0; i<numberSection; i++) {
			NSInteger row = [self numberOfRowsInSection:i];
			if(row ==0 ){
				zeroRow++;
			}
		}
		//添加修改无数据页面
		if (zeroRow == numberSection) {
			if (!self.noDataView){
				UIImage *image = self.noDataImage ?self.noDataImage:[UIImage imageNamed:@"nodata.jpg"];
				UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
				UIView *view = [[UIView alloc] init];
				view.backgroundColor = [UIColor whiteColor];
				[view addSubview:imageView];
				imageView.center = self.center;
				imageView.frame = CGRectMake(10, 0, [UIScreen mainScreen].bounds.size.width-20, [UIScreen mainScreen].bounds.size.height);
				self.noDataView = view;
			}
			
			self.noDataView.frame = self.frame;
			[self addSubview:self.noDataView];
			
			
		}else {
			[self.noDataView removeFromSuperview];
			
		}

		
	});
	
	//}
	
}

- (void)noDataLayoutSubviews
{
	[self noDataLayoutSubviews];
	self.didLayout = YES;
	
}


@end
