//
//  MaterialViewController.m
//  ZHULife
//
//  Created by leileigege on 2016/12/27.
//  Copyright © 2016年 leileigege. All rights reserved.
//

#import "MaterialViewController.h"
#import "MaterialTableViewCell.h"
@interface MaterialViewController ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation MaterialViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{


    return self.foodModel.material.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    MaterialTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"materialCell" forIndexPath:indexPath];
    cell.materialName.text =[self.foodModel.material[indexPath.row] mname];
    cell.materialNum.text = [self.foodModel.material[indexPath.row] amount];
  
    
    
    return cell;




}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{



    return 25;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
   
}



@end
