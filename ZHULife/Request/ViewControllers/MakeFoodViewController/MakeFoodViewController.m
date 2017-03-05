//
//  MakeFoodViewController.m
//  ZHULife
//
//  Created by leileigege on 2016/12/20.
//  Copyright © 2016年 leileigege. All rights reserved.
//

#import "MakeFoodViewController.h"
#import "SDWebImageManager.h"
#import "SDImageCache.h"
#import "CollectModel.h"
@interface MakeFoodViewController ()
{
    int lastBtnTag;
    
    
}
@end

@implementation MakeFoodViewController
#pragma mark - life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    lastBtnTag = 1;
  
       self.automaticallyAdjustsScrollViewInsets = NO;
    [self setTitleView];
    [self setChildView];
    [self setLeftBarBtn];
   
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
  self.tabBarController.tabBar.hidden=YES;
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


-(void)setTitleView{
    UIView *titleView = [UIView new];
    titleView.bounds = CGRectMake(0, 0, SCREEN_WIDTH/2.0, 44);
    UIButton *introBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [introBtn setTitle:@"简介" forState:UIControlStateNormal];
    [introBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [introBtn setTitleColor:[UIColor colorWithRed:171/256.0 green:209/256.0 blue:62/256.0 alpha:1] forState:UIControlStateSelected];
    introBtn.tag = 1;
    introBtn.selected = YES;
    [introBtn addTarget:self action:@selector(introBtnPress:) forControlEvents:UIControlEventTouchUpInside];
    [titleView addSubview:introBtn];
    [introBtn makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(titleView.left);
        make.top.equalTo(titleView.top);
        make.bottom.equalTo(titleView.bottom);
        make.width.equalTo(titleView.width).multipliedBy(0.33);
        
    }];
    UIButton *materialBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [materialBtn setTitle:@"材料" forState:UIControlStateNormal];
    [materialBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [materialBtn setTitleColor:[UIColor colorWithRed:171/256.0 green:209/256.0 blue:62/256.0 alpha:1] forState:UIControlStateSelected];
    materialBtn.tag = 2;
    [materialBtn addTarget:self action:@selector(materialBtnBtnPress:) forControlEvents:UIControlEventTouchUpInside];
    
    [titleView addSubview:materialBtn];
    [materialBtn makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(introBtn.right);
        make.top.equalTo(titleView.top);
        make.bottom.equalTo(titleView.bottom);
        make.width.equalTo(titleView.width).multipliedBy(0.33);
    }];
    UIButton *processBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [processBtn setTitle:@"步骤" forState:UIControlStateNormal];
    [processBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [processBtn setTitleColor:[UIColor colorWithRed:171/256.0 green:209/256.0 blue:62/256.0 alpha:1] forState:UIControlStateSelected];
    processBtn.tag = 3;
    [processBtn addTarget:self action:@selector(processBtnBtnPress:) forControlEvents:UIControlEventTouchUpInside];
    
    [titleView addSubview:processBtn];
    [processBtn makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(materialBtn.right);
        make.top.equalTo(titleView.top);
        make.bottom.equalTo(titleView.bottom);
        make.width.equalTo(titleView.width).multipliedBy(0.33);
    }];
    
    self.navigationItem.titleView = titleView;
}

-(void)setChildView{
    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"LLStoryboard" bundle:[NSBundle mainBundle]];
    IntroViewController * introViewController = [storyBoard instantiateViewControllerWithIdentifier:@"IntroViewController"];
    introViewController.foodModel = self.foodModel;
  
    MaterialViewController *materialViewController  = [storyBoard instantiateViewControllerWithIdentifier:@"MaterialViewController"];
    ProcessViewcontroller *processViewcontroller  = [storyBoard instantiateViewControllerWithIdentifier:@"ProcessViewcontroller"];

    [self addChildViewController:introViewController];
    [self addChildViewController:materialViewController];
    [self addChildViewController:processViewcontroller];

    [introViewController didMoveToParentViewController:self];
    
    introViewController.view.frame = self.contentView.bounds;
    
    [self.contentView addSubview:introViewController.view];
}
#pragma mark - delegate methods
#pragma mark UITableViewDatasource
#pragma mark UITableViewDelegate
#pragma mark UIScrollViewDelegate
#pragma mark - Custom delegate methods
#pragma mark - Event Response
-(void)leftPress{
    [self.navigationController popViewControllerAnimated:YES];

}
-(void)introBtnPress:(UIButton *)btn{
    if (btn.tag == lastBtnTag) {
        return;
    }
    UIViewController *last = self.childViewControllers[lastBtnTag-1];
    //2 找到当前的视图控制器
    IntroViewController *current = self.childViewControllers[btn.tag -1];
    current.foodModel = self.foodModel;
    current.view.frame = self.contentView.bounds;
    
    [self transitionFromViewController:last toViewController:current duration:1 options:UIViewAnimationOptionTransitionCrossDissolve  animations:nil completion:nil];
    [self changeBtnColor:btn];
}
-(void)materialBtnBtnPress:(UIButton *)btn{
    
    if (btn.tag == lastBtnTag) {
        return;
    }
    UIViewController *last = self.childViewControllers[lastBtnTag-1];
    //2 找到当前的视图控制器
    MaterialViewController *current = self.childViewControllers[btn.tag -1];
    current.foodModel = self.foodModel;
    current.view.frame = self.contentView.bounds;
    
    [self transitionFromViewController:last toViewController:current duration:1 options:UIViewAnimationOptionTransitionCrossDissolve  animations:nil completion:nil];
    
    [self changeBtnColor:btn];
   
}
-(void)processBtnBtnPress:(UIButton *)btn{
    if (btn.tag == lastBtnTag) {
        return;
    }
    UIViewController *last = self.childViewControllers[lastBtnTag-1];
    //2 找到当前的视图控制器
    ProcessViewcontroller *current = self.childViewControllers[btn.tag -1];
    current.foodModel = self.foodModel;
    current.view.frame = self.contentView.bounds;
    
    [self transitionFromViewController:last toViewController:current duration:1 options:UIViewAnimationOptionTransitionCrossDissolve  animations:nil completion:nil];
    
    
    [self changeBtnColor:btn];
}
-(void)changeBtnColor:(UIButton *)btn{
    if (btn.tag == lastBtnTag) {
        return;
    }
    btn.selected = YES;
    UIButton *lastBtn = (UIButton *)[self.navigationItem.titleView viewWithTag:lastBtnTag];
    lastBtn.selected = NO;
    lastBtnTag =(int) btn.tag;
    
}

- (IBAction)collectFood:(UIButton *)sender {
    CollectModel *collectModel = [[CollectModel alloc]init];
    NSString* strUrl = self.foodModel.pic;
    SDWebImageManager *manager = [SDWebImageManager sharedManager];
    NSString* key = [manager cacheKeyForURL:[NSURL URLWithString:strUrl]];
    SDImageCache* cache = [SDImageCache sharedImageCache];
    //此方法会先从memory中取。
    collectModel.foodImage = [cache imageFromDiskCacheForKey:key];
    collectModel.foodName = self.foodModel.name;
    collectModel.foodId = self.foodModel.idField;
    NSLog(@"%@",collectModel.foodId);
    
    
    NSData *data = [NSData dataWithContentsOfFile:[NSHomeDirectory() stringByAppendingPathComponent:@"Documents/data.plist"]];
    NSKeyedUnarchiver *unarchiver = [[NSKeyedUnarchiver alloc] initForReadingWithData:data];
    NSArray *getArr = [unarchiver decodeObjectForKey:@"arrModel"];
    [unarchiver finishDecoding];
     NSMutableArray *arr = [[NSMutableArray alloc]initWithArray:getArr];
    BOOL isEqual =YES;
    for (CollectModel *Model in arr) {
        if ([Model.foodId isEqualToString:collectModel.foodId]) {
            isEqual =NO;
        }
    }
    NSString *notificationStr;
    if (isEqual) {
        [arr addObject:collectModel];
        notificationStr = @"添加成功😊";
    }
    else{
        notificationStr = @"你已经添加过这个啦😱";
    }
    NSMutableData *mudata = [NSMutableData data];
    NSKeyedArchiver *archiver = [[NSKeyedArchiver alloc] initForWritingWithMutableData:mudata];
    [archiver encodeObject:arr forKey:@"arrModel"];
    [archiver finishEncoding];
    [mudata writeToFile:[NSHomeDirectory() stringByAppendingPathComponent:@"Documents/data.plist"] atomically:YES];
    NSLog(@"%@",NSHomeDirectory());

    UIAlertController *alertCon = [UIAlertController alertControllerWithTitle:@"提示" message:notificationStr preferredStyle:1];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    [alertCon addAction:cancelAction];
    [self presentViewController:alertCon animated:YES completion:nil];
    


}
#pragma mark - Private methods
#pragma mark - setters and getters

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
  
}



@end
