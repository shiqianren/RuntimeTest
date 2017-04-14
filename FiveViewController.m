//
//  FiveViewController.m
//  RuntimeTest
//
//  Created by shiqianren on 2017/4/14.
//  Copyright © 2017年 shiqianren. All rights reserved.
//

#import "FiveViewController.h"
#import "Movie.h"
@interface FiveViewController ()
@property (nonatomic, retain) NSMutableArray *allDataArray;
@end

@implementation FiveViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	self.view.backgroundColor = [UIColor whiteColor];
	
	NSDictionary *user = @{ @"name":@"zhangsan",
							@"age": @(12),
							@"sex": @"man",
							};
	
	NSDictionary *dict = @{ @"movieId":@"28678",
							@"movieName": @"539fU8276",
							@"pic_url": @"fsdfds",
							@"user" : user
							};
	NSArray *addarr = @[dict ,dict, dict];
	
	NSMutableDictionary *mudict = [NSMutableDictionary dictionaryWithDictionary:dict];
	
	[mudict setObject:user forKey:@"user"];
	
	for(NSDictionary *item in addarr){
		Movie *movie = [Movie objectWithDict:item];
		[self.allDataArray addObject:movie];
	
	}
	
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
