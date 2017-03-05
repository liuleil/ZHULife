//
//  FoodListTableViewCell.h
//  ZHULife
//
//  Created by leileigege on 2016/12/20.
//  Copyright © 2016年 leileigege. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FoodListTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *foodImag;
@property (weak, nonatomic) IBOutlet UILabel *foodName;
@property (weak, nonatomic) IBOutlet UILabel *foodTag;
@property (weak, nonatomic) IBOutlet UILabel *foodTime;

@end
