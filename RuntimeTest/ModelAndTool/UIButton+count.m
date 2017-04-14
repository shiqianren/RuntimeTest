//
//  UIButton+count.m
//  RuntimeTest
//
//  Created by shiqianren on 2017/4/13.
//  Copyright © 2017年 shiqianren. All rights reserved.
//

#import "UIButton+count.h"
#import "Tool.h"
@implementation UIButton (count)

+(void)load{
	static dispatch_once_t onceToken;
	dispatch_once(&onceToken, ^{
		
		Class selfClass = [self class];
		
		SEL oriSEL = @selector(sendAction:to:forEvent:);
		Method oriMethod = class_getInstanceMethod(selfClass, oriSEL);
		
		SEL cusSEL = @selector(mySendAction:to:forEvent:);
		Method custMethod = class_getInstanceMethod(selfClass, cusSEL);
		
		BOOL addSucc = class_addMethod(selfClass, oriSEL, method_getImplementation(custMethod),  method_getTypeEncoding(custMethod));
		if (addSucc ){
			class_replaceMethod(selfClass, cusSEL, method_getImplementation(oriMethod), method_getTypeEncoding(oriMethod));
		}else {
		 method_exchangeImplementations(oriMethod, custMethod);
		}
		
	});

	

}


-(void)mySendAction:(SEL)action to:(id)target forEvent:(UIEvent *)event {
	[[Tool shareManager] addCount];
	[self mySendAction:action to:target forEvent:event];
}


@end
