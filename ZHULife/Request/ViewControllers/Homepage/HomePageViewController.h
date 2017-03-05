//
//  ViewController.h
//  ZHULife
//
//  Created by leileigege on 2016/12/8.
//  Copyright © 2016年 leileigege. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomePageViewController : UIViewController
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (weak, nonatomic) IBOutlet UIScrollView *headScrollView;
@property (weak, nonatomic) IBOutlet UILabel *foodNameLab;

- (IBAction)breakfast:(UIButton *)sender;
- (IBAction)lunch:(UIButton *)sender;
- (IBAction)afternoonTea:(UIButton *)sender;
- (IBAction)dinner:(UIButton *)sender;
- (IBAction)loseWeight:(UIButton *)sender;
- (IBAction)slimming:(UIButton *)sender;
- (IBAction)detox:(UIButton *)sender;
- (IBAction)cultivate:(UIButton *)sender;

@end

