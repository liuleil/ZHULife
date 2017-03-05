//
//  ProcessViewcontroller.m
//  ZHULife
//
//  Created by leileigege on 2016/12/27.
//  Copyright © 2016年 leileigege. All rights reserved.
//

#import "ProcessViewcontroller.h"
#import "ProcessTableViewCell.h"
#import <UIImageView+WebCache.h>
@interface ProcessViewcontroller ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation ProcessViewcontroller

- (void)viewDidLoad {
    [super viewDidLoad];
   
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    
    return self.foodModel.process.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    ProcessTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"processCell" forIndexPath:indexPath];
    cell.processNum.text = [NSString stringWithFormat:@"步骤%ld",indexPath.row+1];
    [cell.processImage sd_setImageWithURL:[NSURL URLWithString:[self.foodModel.process[indexPath.row] pic]] placeholderImage:[UIImage imageNamed:@"placeHodelImage"]];
    cell.process.text = [self.foodModel.process[indexPath.row] pcontent];
    
    
    
    return cell;
    
    
    
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    
    return SCREEN_WIDTH/2.0;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}



@end
