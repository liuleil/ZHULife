//
//  FoodViewViewController.h
//  ZHULife
//
//  Created by leileigege on 2016/12/20.
//  Copyright © 2016年 leileigege. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FoodViewViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITableView *foodListTableView;
@property(nonatomic,copy) NSString *classId;
@property(nonatomic,copy) NSString *titleStr;

@end
