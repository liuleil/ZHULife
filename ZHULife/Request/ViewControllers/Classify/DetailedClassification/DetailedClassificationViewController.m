//
//  DetailedClassificationViewController.m
//  ZHULife
//
//  Created by leileigege on 2016/12/19.
//  Copyright © 2016年 leileigege. All rights reserved.
//

#import "DetailedClassificationViewController.h"
#import "LLCollectionViewCell.h"
#import "LLCollectionReusableView.h"
#import "LLClassList.h"
#import "FoodViewViewController.h"
@interface DetailedClassificationViewController ()<UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,UIGestureRecognizerDelegate>

@end

@implementation DetailedClassificationViewController
#pragma mark - life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    self.tabBarController.tabBar.hidden=YES;
    self.navigationController.interactivePopGestureRecognizer.enabled = YES;
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.navigationItem.title = self.titleStr;
    [self setLeftBarBtn];
   
}
- (void)viewDidAppear:(BOOL)animated{
     __weak typeof(self) weakSelf = self;
        self.navigationController.interactivePopGestureRecognizer.delegate = weakSelf;
     }
#pragma mark - initVews

-(void)setLeftBarBtn{
    UIButton *leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [leftButton setImage:[UIImage imageNamed:@"topBar_backBtnGreen"]   forState:UIControlStateNormal];
    leftButton.bounds = CGRectMake(0, 0, 60,60 );
    [leftButton addTarget:self action:@selector(leftPress) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *left_Btn = [[UIBarButtonItem alloc]initWithCustomView:leftButton];
    UIBarButtonItem *negativeSpacer = [[UIBarButtonItem alloc]
                                       initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace
                                       target:nil action:nil];
    negativeSpacer.width = -20;
    self.navigationItem.leftBarButtonItems = [NSArray arrayWithObjects:negativeSpacer,left_Btn, nil];
}

#pragma mark - delegate methods
#pragma mark - UIGestureRecognizerDelegate
- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer*)gestureRecognizer{
        //判断是否为rootViewController
        if (self.navigationController && self.navigationController.viewControllers.count == 1) {
                 return NO;
             }
         return YES;
}
#pragma mark UIConllectionViewDatasource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.classListArr.count;

}
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    LLCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"foodCell" forIndexPath:indexPath];
    LLClassList *list = self.classListArr[indexPath.row];
    cell.classBtn.tag = indexPath.row;
    [ cell.classBtn setTitle:list.name forState:UIControlStateNormal];
    [cell.classBtn addTarget:self action:@selector(pushToFoodList:) forControlEvents:UIControlEventTouchUpInside];
    
    return cell;
}
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{

    return 1;

}
#pragma mark UICollectionViewDelegate



//定义每个UICollectionViewCell 的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(SCREEN_WIDTH/3.5, SCREEN_WIDTH/3.5);
}
//- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
//    LLCollectionReusableView *reuseView = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"titleLab" forIndexPath:indexPath];
// 
//        reuseView.titleLab.text = self.titleStr;
//  
//    return reuseView;
//}

#pragma mark UIScrollViewDelegate
#pragma mark - Custom delegate methods
#pragma mark - Event Response
-(void)pushToFoodList:(UIButton *)btn{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"LLStoryboard" bundle:[NSBundle mainBundle]];
    FoodViewViewController *foodViewViewController = [storyboard instantiateViewControllerWithIdentifier:@"FoodViewViewController"];
    foodViewViewController.classId = [self.classListArr[btn.tag] classid];
     foodViewViewController.titleStr = [self.classListArr[btn.tag] name];
    
    
    
    
    [self.navigationController pushViewController:foodViewViewController animated:YES];
}
-(void)leftPress{
    
    
    [self.navigationController popViewControllerAnimated:YES];
    
}
#pragma mark - Private methods
#pragma mark - setters and getters

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
  
}



@end
