//
//  TwoViewController.m
//  RuntimeTest
//
//  Created by shiqianren on 2017/4/13.
//  Copyright © 2017年 shiqianren. All rights reserved.
//

#import "TwoViewController.h"
#import "Person.h"
#import <objc/runtime.h>
@interface TwoViewController ()
@property (weak, nonatomic) IBOutlet UITextField *areaTextField;
@property (nonatomic, strong) Person *person;
@end

@implementation TwoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
     self.person = [Person new];
    // Do any additional setup after loading the view.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)addMethod:(id)sender {
	  [self sayFrom];
}


-(void)sayFrom {
	class_addMethod([self.person class], @selector(guess), (IMP)gussAnswer, "v@:");
	if ([self.person respondsToSelector:@selector(guess)]){
	[self.person performSelector:@selector(guess)];
	}else {
	   NSLog(@"Sorry,I don't know");
	}
	self.areaTextField.text = @"beijing";
	

}

-(void)guess {
	
 NSLog(@"guess 方法");

}

void gussAnswer(id self, SEL _cmd){

	    NSLog(@"i am from beijing");
	
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
