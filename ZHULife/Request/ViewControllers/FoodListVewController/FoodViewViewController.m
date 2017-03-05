//
//  FoodViewViewController.m
//  ZHULife
//
//  Created by leileigege on 2016/12/20.
//  Copyright © 2016年 leileigege. All rights reserved.
//

#import "FoodViewViewController.h"
#import "FoodListTableViewCell.h"
#import "RequestBase.h"
#import "LLRandomRootClass.h"
#import "LLRandomList.h"
#import <UIImageView+WebCache.h>
#import "MakeFoodViewController.h"
@interface FoodViewViewController ()<UITableViewDelegate,UITableViewDataSource,UIGestureRecognizerDelegate>
@property(nonatomic,copy) NSArray *listArr;

@end

@implementation FoodViewViewController
#pragma mark - life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.navigationItem.title = self.titleStr;
    self.navigationController.interactivePopGestureRecognizer.delegate = nil;  
    [self request];
    [self setLeftBarBtn];
}
- (void)viewDidAppear:(BOOL)animated{
    __weak typeof(self) weakSelf = self;
    self.navigationController.interactivePopGestureRecognizer.delegate = weakSelf;
}
#pragma mark - UIGestureRecognizerDelegate
- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer*)gestureRecognizer{
    //判断是否为rootViewController
    if (self.navigationController && self.navigationController.viewControllers.count == 1) {
        return NO;
    }
    return YES;
}
#pragma mark - initViews
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

#pragma mark - request
-(void)request{
    [RequestBase getReuqestWithPath: @"http://jisusrecipe.market.alicloudapi.com/recipe/byclass" parameters:@{@"classid":self.classId,@"num":@"100",@"start":@"0"} completionHandler:^(id responseObj, NSError *error) {
        
    
        LLRandomRootClass *randomClassMolde = [LLRandomRootClass yy_modelWithJSON:responseObj];
        
        if ([randomClassMolde.status isEqualToString:@"0"]&&[randomClassMolde.msg isEqualToString:@"ok"] ) {
            self.listArr = randomClassMolde.result.list;
            [self.foodListTableView reloadData];
            
        }
        else{
        
            
        }
        
        
    }];









}
#pragma mark - delegate methods
#pragma mark UITableViewDatasource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{


    return self.listArr.count;
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    FoodListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"foodListCell" forIndexPath:indexPath];
    LLRandomList *list = self.listArr[indexPath.row];
    [cell.foodImag sd_setImageWithURL:[NSURL URLWithString:list.pic] placeholderImage:[UIImage imageNamed:@"placeHodelImage"]];
    cell.foodName.text = list.name;
    cell.foodTag.text = list.tag;
    cell.foodTime.text = list.cookingtime;
    

    return cell;
}

#pragma mark UITableViewDelegate
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{


    return (SCREEN_HEIGHT-64)/4.0;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"LLStoryboard" bundle:[NSBundle mainBundle]];
    MakeFoodViewController *makeFoodViewController = [storyboard instantiateViewControllerWithIdentifier:@"MakeFoodViewController"];
    makeFoodViewController.foodModel = self.listArr[indexPath.row];
    [self.navigationController pushViewController:makeFoodViewController animated:YES];


}
#pragma mark UIScrollViewDelegate
#pragma mark - Custom delegate methods
#pragma mark - Event Response
-(void)leftPress{


    [self.navigationController popViewControllerAnimated:YES];

}
#pragma mark - Private methods
#pragma mark - setters and getters
//-(NSArray *)listArr{
//    if (!_listArr) {
//        _listArr = [NSArray new];
//        
//    }
//    
//    return _listArr;
//    
//}
//





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
   
}


@end
