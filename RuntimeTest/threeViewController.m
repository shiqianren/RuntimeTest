//
//  threeViewController.m
//  RuntimeTest
//
//  Created by shiqianren on 2017/4/13.
//  Copyright © 2017年 shiqianren. All rights reserved.
//

#import "threeViewController.h"
#import "Person.h"
#import "Tool.h"
#import <objc/runtime.h>
@interface threeViewController ()
@property (nonatomic, strong) Person *person;
@property (weak, nonatomic) IBOutlet UITextField *textview;
@end

@implementation threeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
	self.person = [Person new];
	
	NSLog(@"%@",_person.sayName);
	
	NSLog(@"%@",_person.saySex);
	
	Method m1 = class_getInstanceMethod([self.person class], @selector(sayName));
	Method m2 = class_getInstanceMethod([self.person class], @selector(saySex));
	
	method_exchangeImplementations(m1, m2);
	
	
	//这里也可以使用 [self.person class],不过要先初始化
	//Method m1 = class_getInstanceMethod([Person class], @selector(sayName));
	//Method m2 = class_getInstanceMethod([Tool class], @selector(changeMethod));
	
	//method_exchangeImplementations(m1, m2);
	
}
- (IBAction)sayName:(id)sender {
	
	self.textview.text = [_person sayName];
	
}
- (IBAction)saySex:(id)sender {
	self.textview.text = [_person saySex];;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
