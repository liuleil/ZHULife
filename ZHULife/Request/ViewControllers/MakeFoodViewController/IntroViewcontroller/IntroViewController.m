//
//  IntroViewController.m
//  ZHULife
//
//  Created by leileigege on 2016/12/27.
//  Copyright © 2016年 leileigege. All rights reserved.
//

#import "IntroViewController.h"
#import <UIImageView+WebCache.h>
@interface IntroViewController ()

@end

@implementation IntroViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self setViews];
    
  
}

-(void)setViews{

    UIView *contentView = [UIView new];
    [self.introScrollView addSubview:contentView];
    
    [contentView makeConstraints:^(MASConstraintMaker *make) {
        // 此行代码表示scrollView中的内容是否有缩进
        make.edges.equalTo(self.introScrollView);
        // 设置宽度或高度 或 什么都不设置
        // 表示scrollView的滑动方向
        make.width.equalTo(self.introScrollView);
    }];
    
    // 添加内容
    
    UIImageView *foodImageView = [UIImageView new];
    
    [contentView addSubview:foodImageView];
    [foodImageView sd_setImageWithURL:[NSURL URLWithString:self.foodModel.pic] placeholderImage:[UIImage imageNamed:@"placeHodelImage"]];
    [foodImageView makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(contentView.top);
        make.left.equalTo(contentView.left);
        make.right.equalTo(contentView.right);
        make.height.equalTo(SCREEN_WIDTH/2.0);
    }];
    UILabel *nameLab = [UILabel new];
    nameLab.text = self.foodModel.name;
    nameLab.font = [UIFont systemFontOfSize:25];
    nameLab.textAlignment = NSTextAlignmentCenter;
    [contentView addSubview:nameLab];
    [nameLab makeConstraints:^(MASConstraintMaker *make)
    {
        make.top.equalTo(foodImageView.bottom);
        make.left.equalTo(contentView.left);
        make.right.equalTo(contentView.right);
        make.height.equalTo(30);
    }];
    
    UILabel *prepareTimeLab = [UILabel new];
    prepareTimeLab.text = [NSString stringWithFormat:@"准备时间:%@",self.foodModel.preparetime];
    prepareTimeLab.font = [UIFont systemFontOfSize:14];
    prepareTimeLab.textAlignment = NSTextAlignmentCenter;
    [contentView addSubview:prepareTimeLab];
    [prepareTimeLab makeConstraints:^(MASConstraintMaker *make)
     {
         make.top.equalTo(nameLab.bottom);
         make.left.equalTo(contentView.left);
         make.width.equalTo(SCREEN_WIDTH/2.0);
         make.height.equalTo(20);
     }];
    
    UILabel *cookingTimeLab = [UILabel new];
    cookingTimeLab.text = [NSString stringWithFormat:@"烹饪时间:%@",self.foodModel.cookingtime];
    cookingTimeLab.font = [UIFont systemFontOfSize:14];
    cookingTimeLab.textAlignment = NSTextAlignmentCenter;
    [contentView addSubview:cookingTimeLab];
    [cookingTimeLab makeConstraints:^(MASConstraintMaker *make)
     {
         make.top.equalTo(nameLab.bottom);
         make.left.equalTo(prepareTimeLab.right);
         make.right.equalTo(contentView.right);
         make.height.equalTo(20);
     }];
    
    UILabel *classLab = [UILabel new];
    classLab.text = [NSString stringWithFormat:@"类型:%@",self.foodModel.tag];
    classLab.font = [UIFont systemFontOfSize:10];
    classLab.textAlignment = NSTextAlignmentCenter;
    classLab.textColor = [UIColor orangeColor];
    [contentView addSubview:classLab];
    [classLab makeConstraints:^(MASConstraintMaker *make)
     {
         make.top.equalTo(prepareTimeLab.bottom);
         make.left.equalTo(contentView.left);
         make.right.equalTo(contentView.right);
         make.height.equalTo(20);
     }];
    
    UILabel* contentLab = [UILabel new];
    contentLab.text = self.foodModel.content;
    contentLab.font = [UIFont systemFontOfSize:20];
    contentLab.textAlignment = NSTextAlignmentLeft;
    contentLab.numberOfLines = 0;
    contentLab.textColor = LLGreenColor;
    [contentView addSubview:contentLab];
     CGSize size =  [self calculateText:contentLab.text];
    [contentLab makeConstraints:^(MASConstraintMaker *make)
     {
         make.top.equalTo(classLab.bottom);
         make.left.equalTo(contentView.left);
         make.right.equalTo(contentView.right);
         make.height.equalTo(size.height+20.0);
     }];
    
      // 设置contentView的高
    [contentView makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(contentLab.bottom);
    }];


}



- (CGSize)calculateText:(NSString *)str {
    return  [str boundingRectWithSize:CGSizeMake(SCREEN_WIDTH, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:20]} context:nil].size;}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}



@end
