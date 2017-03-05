//
//  MyCollectViewController.m
//  ZHULife
//
//  Created by leileigege on 2016/12/28.
//  Copyright © 2016年 leileigege. All rights reserved.
//

#import "MyCollectViewController.h"
#import "CollectModel.h"
#import "MyCollectCell.h"
@interface MyCollectViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,copy)NSArray *dataArr;

@end

@implementation MyCollectViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.navigationItem.title = @"我的收藏";
    self.navigationController.interactivePopGestureRecognizer.enabled = YES;
    [self.navigationController.navigationBar setBarTintColor:[UIColor colorWithRed:20/255.0 green:155/255.0 blue:213/255.0 alpha:1.0]];
    [self.navigationController.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor],NSForegroundColorAttributeName,nil]];
    
    
    
   
    
    
    
    
    
    
    
    
}
-(void)viewWillAppear:(BOOL)animated{

    [super viewWillAppear:animated];
    NSData *data = [NSData dataWithContentsOfFile:[NSHomeDirectory() stringByAppendingPathComponent:@"Documents/data.plist"]];
    NSKeyedUnarchiver *unarchiver = [[NSKeyedUnarchiver alloc] initForReadingWithData:data];
    self.dataArr = [unarchiver decodeObjectForKey:@"arrModel"];
    [unarchiver finishDecoding];
   
    NSLog(@"%@",[_dataArr[0] foodName]);
    [self.collectTableView  reloadData];

}





#pragma mark UITableViewDatasource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    
    return self.dataArr.count;
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    MyCollectCell *cell = [tableView dequeueReusableCellWithIdentifier:@"collectCell" forIndexPath:indexPath];
    cell.collectFoodName.text = [self.dataArr[indexPath.row] foodName];
    cell.collectImageView.image = [self.dataArr[indexPath.row] foodImage];
   
//    cell.foodName.text = list.name;
//    cell.foodTag.text = list.tag;
//    cell.foodTime.text = list.cookingtime;
    
    
    return cell;
}

#pragma mark UITableViewDelegate
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    return 60;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
 
}



@end
