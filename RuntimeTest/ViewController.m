//
//  ViewController.m
//  RuntimeTest
//
//  Created by shiqianren on 2017/4/13.
//  Copyright © 2017年 shiqianren. All rights reserved.
//

#import "ViewController.h"
#import "FiveViewController.h"
#import "SixViewController.h"
#import "FourViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)encodeClick:(id)sender {
	FiveViewController *fiveVc = [[FiveViewController alloc] init];
	[self.navigationController pushViewController:fiveVc animated:true];
}
- (IBAction)dicToModelClick:(id)sender {
	SixViewController *sixVc = [[SixViewController alloc]init];
	[self.navigationController pushViewController:sixVc animated:true];
}
- (IBAction)addMethodClick:(id)sender {
	FourViewController *fourVc = [[FourViewController alloc] init];
	[self.navigationController pushViewController:fourVc animated:true];
}


- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}


@end
