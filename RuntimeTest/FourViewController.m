//
//  FourViewController.m
//  RuntimeTest
//
//  Created by shiqianren on 2017/4/14.
//  Copyright © 2017年 shiqianren. All rights reserved.
//

#import "FourViewController.h"
#import "UIButton+count.h"
@interface FourViewController ()

@end

@implementation FourViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
	
	self.view.backgroundColor = [UIColor whiteColor];
	UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
	button.frame = CGRectMake(100, 100, 100, 100);
	[button setTitle:@"按钮" forState:UIControlStateNormal];
	[button addTarget:self action:@selector(ButtonClick) forControlEvents:UIControlEventTouchUpInside];
	[self.view addSubview:button];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)ButtonClick
{
	NSLog(@"按钮被点击了");
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
