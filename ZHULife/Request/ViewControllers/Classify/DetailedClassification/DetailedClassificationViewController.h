//
//  DetailedClassificationViewController.h
//  ZHULife
//
//  Created by leileigege on 2016/12/19.
//  Copyright © 2016年 leileigege. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailedClassificationViewController : UIViewController
@property (weak, nonatomic) IBOutlet UICollectionView *foodCollectionView;
@property(nonatomic,strong) NSArray *classListArr;
@property(nonatomic,copy) NSString *titleStr;
@end
