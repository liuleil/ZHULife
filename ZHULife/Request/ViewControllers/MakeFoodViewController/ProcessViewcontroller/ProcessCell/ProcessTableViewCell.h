//
//  ProcessTableViewCell.h
//  ZHULife
//
//  Created by leileigege on 2016/12/27.
//  Copyright © 2016年 leileigege. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProcessTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *processNum;
@property (weak, nonatomic) IBOutlet UIImageView *processImage;
@property (weak, nonatomic) IBOutlet UILabel *process;

@end
