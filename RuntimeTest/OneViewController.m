//
//  OneViewController.m
//  RuntimeTest
//
//  Created by shiqianren on 2017/4/13.
//  Copyright © 2017年 shiqianren. All rights reserved.
//

#import "OneViewController.h"
#import "Person.h"
#import <objc/runtime.h>
@interface OneViewController ()
@property (weak, nonatomic) IBOutlet UITextField *nameText;
@property (nonatomic, strong) Person *person;
@end

@implementation OneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	self.person = [Person new];
	_person.name = @"xiaoming";
	
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)chageName:(id)sender {
	[self sayName];
}


-(void)sayName{
	unsigned int count = 0;;
	Ivar *ivar = class_copyIvarList([self.person class], &count);
	for (int i =0 ; i< count; i++) {
		Ivar var = ivar[i];
		const char *varName = ivar_getName(var);
		NSString *proname = [NSString stringWithUTF8String:varName];
		if ([proname isEqualToString:@"_name"]){//属性需要添加下滑线
			object_setIvar(self.person, var, @"daming");
			break;
		}
	}
	self.nameText.text = self.person.name;
	
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
