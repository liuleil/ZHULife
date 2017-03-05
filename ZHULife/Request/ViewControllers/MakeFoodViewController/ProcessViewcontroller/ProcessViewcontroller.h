//
//  ProcessViewcontroller.h
//  ZHULife
//
//  Created by leileigege on 2016/12/27.
//  Copyright © 2016年 leileigege. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LLRandomList.h"
@interface ProcessViewcontroller : UIViewController
@property (weak, nonatomic) IBOutlet UITableView *processTableView;
@property(nonatomic,strong) LLRandomList *foodModel;

@end
