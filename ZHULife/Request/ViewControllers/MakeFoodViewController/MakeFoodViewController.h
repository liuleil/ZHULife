//
//  MakeFoodViewController.h
//  ZHULife
//
//  Created by leileigege on 2016/12/20.
//  Copyright © 2016年 leileigege. All rights reserved.
//

#import <UIKit/UIKit.h>
#import"LLRandomList.h"
#import "IntroViewController.h"
#import "MaterialViewController.h"
#import "ProcessViewcontroller.h"
@interface MakeFoodViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIView *contentView;
@property(nonatomic,strong) LLRandomList *foodModel;
- (IBAction)collectFood:(UIButton *)sender;

@end
