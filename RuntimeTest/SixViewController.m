//
//  SixViewController.m
//  RuntimeTest
//
//  Created by shiqianren on 2017/4/14.
//  Copyright © 2017年 shiqianren. All rights reserved.
//

#import "SixViewController.h"
#import "Movie.h"
@interface SixViewController ()

@end

@implementation SixViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	self.view.backgroundColor = [UIColor whiteColor];
	Movie *m = [Movie new];
	m.movieName = @"aaaaaaaa";
	m.movieId = @"1222331";
	m.pic_url = @"llllllllll";
	
	NSString *document  = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).lastObject;
	NSString *filePath = [document stringByAppendingString:@"/123.txt"];
	
	//模型写入文件
	[NSKeyedArchiver archiveRootObject:m toFile:filePath];
	
	
	//读取
	Movie *movie =  [NSKeyedUnarchiver unarchiveObjectWithFile:filePath];
	
	NSLog(@"----%@",movie);
	
	
    // Do any additional setup after loading the view.
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
