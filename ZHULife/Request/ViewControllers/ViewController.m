//
//  ViewController.m
//  ZHULife
//
//  Created by leileigege on 2016/12/8.
//  Copyright © 2016年 leileigege. All rights reserved.
//

#import "ViewController.h"
#import "RequestBase.h"
#import "GetIp.h"
@interface ViewController ()
@property(nonatomic,copy) NSString *deviceIp;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    _deviceIp = [GetIp deviceIPAdress];
    [self requestNews];
}
-(void)requestNews{
    NSLog(@"正在请求.....");
    [RequestBase getReuqestWithPath: @"http://jisusrecipe.market.alicloudapi.com/recipe/search" parameters:@{@"keyword":@"糖醋排骨",@"num":@"10"} completionHandler:^(id responseObj, NSError *error) {
        NSString *dataStr = [[NSString alloc]initWithData:responseObj encoding:NSUTF8StringEncoding];
        NSLog(@"%@",dataStr);
    }];
    
     NSLog(@"请求失败.....");

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
  
}


@end
