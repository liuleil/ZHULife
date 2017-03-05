//
//  ViewController.m
//  ZHULife
//
//  Created by leileigege on 2016/12/8.
//  Copyright © 2016年 leileigege. All rights reserved.
//HomePage


#import "HomePageViewController.h"
#import "RequestBase.h"
#import "GetIp.h"
#import "HomeFoodCollectionViewCell.h"
#import "LLRandomRootClass.h"
#import "LLRandomList.h"
#import <UIImageView+WebCache.h>
#import <UIButton+WebCache.h>
#import "FoodViewViewController.h"
#import "MakeFoodViewController.h"

@interface HomePageViewController ()<UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property(nonatomic,copy) NSString *deviceIp;
@property(nonatomic,assign) int randomNum;
@property(nonatomic,strong) NSMutableArray *listArr;
@property(nonatomic,strong) NSMutableArray *headerListArr;
@property(nonatomic,weak)   NSTimer *tim;
@property(nonatomic,assign) BOOL first;



@property (weak, nonatomic) IBOutlet UIPageControl *page;


//@property(nonatomic,strong) UIButton *lastBtn;
@property(nonatomic,strong) UIButton *currentBtn;
@property(nonatomic,strong) UIButton *reuseBtn;
//@property(nonatomic,assign) NSInteger currentIndext;
//@property(nonatomic,assign) NSInteger lastIndext;
//@property(nonatomic,assign) NSInteger nextIndext;









@end

@implementation HomePageViewController
int currentIndex,nextIndex;
#pragma mark - life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
//    _deviceIp = [GetIp deviceIPAdress];
//   self.headScrollView.bounces = NO;
    self.navigationItem.title = @"每日推荐";
   self.navigationController.interactivePopGestureRecognizer.enabled = YES;
    [self.navigationController.navigationBar setBarTintColor:[UIColor colorWithRed:20/255.0 green:155/255.0 blue:213/255.0 alpha:1.0]];
    [self.navigationController.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor],NSForegroundColorAttributeName,nil]];
    _randomNum = arc4random_uniform(100);
        [self requestNews];
    
    [self initViews];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    if (self.first == YES) {
        
        self.headScrollView.contentOffset = CGPointMake(SCREEN_WIDTH, 0);
    }
    self.automaticallyAdjustsScrollViewInsets = YES;
     self.tabBarController.tabBar.hidden=NO;

   
    if (_tim) {
          [_tim setFireDate:[NSDate dateWithTimeIntervalSinceNow:2]];
        
    }
    self.first = NO;
}
-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    if (_tim) {
     [_tim setFireDate:[NSDate distantFuture]];
        
    }
    self.first = YES;
}
#pragma mark - request
-(void)requestNews{
    [RequestBase getReuqestWithPath: @"http://jisusrecipe.market.alicloudapi.com/recipe/byclass" parameters:@{@"classid":[NSString stringWithFormat:@"%d",_randomNum],@"num":@"14",@"start":@"0"} completionHandler:^(id responseObj, NSError *error) {
        LLRandomRootClass *randomClassMolde = [LLRandomRootClass yy_modelWithJSON:responseObj];
        for (int i = 0; i< randomClassMolde.result.list.count; i++) {

            if (i <= 3) {
                [self.headerListArr addObject:randomClassMolde.result.list[i]];
            }
            else{
                [self.listArr addObject:randomClassMolde.result.list[i]];
            }
        }
        NSLog(@"%@",randomClassMolde.status);
        NSLog(@"%@",randomClassMolde.msg);

        if ([randomClassMolde.status isEqualToString:@"0"]) {
            [self.collectionView reloadData];
            [self setHeadScrollView];


        }
        else{

        
        }

       
    }];
  
}
#pragma mark - initViews
-(void)initViews{
    [self setRightBarBtn];
    
    


}
-(void)setHeadScrollView{
    
    self.headScrollView.contentSize = CGSizeMake(SCREEN_WIDTH*3, self.headScrollView.bounds.size.height);
    self.headScrollView.contentOffset = CGPointMake(SCREEN_WIDTH, 0);
    self.currentBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.currentBtn.frame = CGRectMake(SCREEN_WIDTH, 0, SCREEN_WIDTH, self.headScrollView.bounds.size.height);
    [self.currentBtn sd_setBackgroundImageWithURL:[NSURL URLWithString:[self.headerListArr[currentIndex] pic]] forState:UIControlStateNormal];
    self.reuseBtn = [UIButton buttonWithType:UIButtonTypeCustom];
      self.reuseBtn.frame = CGRectMake(SCREEN_WIDTH*2, 0, SCREEN_WIDTH, self.headScrollView.bounds.size.height);
    [self.headScrollView addSubview:self.currentBtn];
    [self.headScrollView addSubview:self.reuseBtn];
    self.foodNameLab.text = [self.headerListArr[currentIndex] name ];
    

    
    
    _tim = [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(move:) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:_tim forMode:NSRunLoopCommonModes];
//    [[NSRunLoop currentRunLoop] run];
  



}
-(void)setRightBarBtn{
    UIButton *rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [rightButton setImage:[UIImage imageNamed:@"order_search"]   forState:UIControlStateNormal];

    rightButton.bounds = CGRectMake(0, 0, 60,60 );
    [rightButton addTarget:self action:@selector(rightPress:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *right_Btn = [[UIBarButtonItem alloc]initWithCustomView:rightButton];
    UIBarButtonItem *negativeSpacer = [[UIBarButtonItem alloc]
                                       initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace
                                       target:nil action:nil];
    negativeSpacer.width = -20;
    self.navigationItem.rightBarButtonItems = [NSArray arrayWithObjects:negativeSpacer,right_Btn, nil];
    
}

#pragma mark - Event Response
- (IBAction)breakfast:(UIButton *)sender {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"LLStoryboard" bundle:[NSBundle mainBundle]];
    FoodViewViewController *foodViewViewController = [storyboard instantiateViewControllerWithIdentifier:@"FoodViewViewController"];
    foodViewViewController.classId = [NSString stringWithFormat:@"%ld",sender.tag];
    foodViewViewController.titleStr = @"早餐";
       [self.navigationController pushViewController:foodViewViewController animated:YES];
}

- (IBAction)lunch:(UIButton *)sender {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"LLStoryboard" bundle:[NSBundle mainBundle]];
    FoodViewViewController *foodViewViewController = [storyboard instantiateViewControllerWithIdentifier:@"FoodViewViewController"];
    foodViewViewController.classId = [NSString stringWithFormat:@"%ld",sender.tag];
    foodViewViewController.titleStr = @"午餐";
       [self.navigationController pushViewController:foodViewViewController animated:YES];
}

- (IBAction)afternoonTea:(UIButton *)sender {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"LLStoryboard" bundle:[NSBundle mainBundle]];
    FoodViewViewController *foodViewViewController = [storyboard instantiateViewControllerWithIdentifier:@"FoodViewViewController"];
    foodViewViewController.classId = [NSString stringWithFormat:@"%ld",sender.tag];
    foodViewViewController.titleStr = @"下午茶";
       [self.navigationController pushViewController:foodViewViewController animated:YES];
    
}

- (IBAction)dinner:(UIButton *)sender {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"LLStoryboard" bundle:[NSBundle mainBundle]];
    FoodViewViewController *foodViewViewController = [storyboard instantiateViewControllerWithIdentifier:@"FoodViewViewController"];
    foodViewViewController.classId = [NSString stringWithFormat:@"%ld",sender.tag];
    foodViewViewController.titleStr = @"晚餐";
       [self.navigationController pushViewController:foodViewViewController animated:YES];
}

- (IBAction)loseWeight:(UIButton *)sender {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"LLStoryboard" bundle:[NSBundle mainBundle]];
    FoodViewViewController *foodViewViewController = [storyboard instantiateViewControllerWithIdentifier:@"FoodViewViewController"];
    foodViewViewController.classId = [NSString stringWithFormat:@"%ld",sender.tag];
    foodViewViewController.titleStr = @"减肥";
       [self.navigationController pushViewController:foodViewViewController animated:YES];
}

- (IBAction)slimming:(UIButton *)sender {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"LLStoryboard" bundle:[NSBundle mainBundle]];
    FoodViewViewController *foodViewViewController = [storyboard instantiateViewControllerWithIdentifier:@"FoodViewViewController"];
    foodViewViewController.classId = [NSString stringWithFormat:@"%ld",sender.tag];
    foodViewViewController.titleStr = @"瘦身";
       [self.navigationController pushViewController:foodViewViewController animated:YES];
}

- (IBAction)detox:(UIButton *)sender {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"LLStoryboard" bundle:[NSBundle mainBundle]];
    FoodViewViewController *foodViewViewController = [storyboard instantiateViewControllerWithIdentifier:@"FoodViewViewController"];
    foodViewViewController.classId = [NSString stringWithFormat:@"%ld",sender.tag];
    foodViewViewController.titleStr = @"排毒";
       [self.navigationController pushViewController:foodViewViewController animated:YES];
}

- (IBAction)cultivate:(UIButton *)sender {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"LLStoryboard" bundle:[NSBundle mainBundle]];
    FoodViewViewController *foodViewViewController = [storyboard instantiateViewControllerWithIdentifier:@"FoodViewViewController"];
    foodViewViewController.classId = [NSString stringWithFormat:@"%ld",sender.tag];
    foodViewViewController.titleStr = @"养颜";
       [self.navigationController pushViewController:foodViewViewController animated:YES];
}
-(void)rightPress:(UIButton *)btn{

    NSLog(@"按了右边按钮");

}

#pragma mark - delegate methods
#pragma mark UIConllectionViewDatasource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.listArr.count;
    
}
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    HomeFoodCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"HomeFoodCell" forIndexPath:indexPath];
        LLRandomList *list = self.listArr[indexPath.row];

        [cell.foodImage sd_setImageWithURL:[NSURL URLWithString:list.pic] placeholderImage:[UIImage imageNamed:@"placeHodelImage"]];
    cell.foodName.text = list.name;
   
        return cell;
}
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    
    return 1;
    
}
#pragma mark UICollectionViewDelegate



//定义每个UICollectionViewCell 的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(SCREEN_WIDTH/2 -10, SCREEN_WIDTH/2 -10);
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{

    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"LLStoryboard" bundle:[NSBundle mainBundle]];
    MakeFoodViewController *makeFoodViewController = [storyboard instantiateViewControllerWithIdentifier:@"MakeFoodViewController"];
    makeFoodViewController.foodModel = self.listArr[indexPath.row];
    [self.navigationController pushViewController:makeFoodViewController animated:YES];

    
}



#pragma mark UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    
    if (scrollView == self.headScrollView) {
        float x = scrollView.contentOffset.x;
        if (x > SCREEN_WIDTH) {
            self.reuseBtn.frame = CGRectMake(SCREEN_WIDTH*2, 0, SCREEN_WIDTH, self.headScrollView.bounds.size.height);
            nextIndex = (currentIndex+1)%4;
            [self.reuseBtn sd_setBackgroundImageWithURL:[NSURL URLWithString:[self.headerListArr[nextIndex] pic]] forState:UIControlStateNormal];
            if (x >= SCREEN_WIDTH*2) {
                scrollView.contentOffset = CGPointMake(SCREEN_WIDTH+(x-SCREEN_WIDTH*2), 0);
                 [self.currentBtn sd_setBackgroundImageWithURL:[NSURL URLWithString:[self.headerListArr[nextIndex] pic]] forState:UIControlStateNormal];
                currentIndex = nextIndex;
                   self.foodNameLab.text = [self.headerListArr[currentIndex] name ];
            }
        }
        if (x < SCREEN_WIDTH) {
            self.reuseBtn.frame = CGRectMake(0, 0, SCREEN_WIDTH, self.headScrollView.bounds.size.height);
            nextIndex = (currentIndex+3)%4;
            [self.reuseBtn sd_setBackgroundImageWithURL:[NSURL URLWithString:[self.headerListArr[nextIndex] pic]] forState:UIControlStateNormal];
            if (x <= 0) {
                scrollView.contentOffset = CGPointMake(SCREEN_WIDTH+x, 0);
                [self.currentBtn sd_setBackgroundImageWithURL:[NSURL URLWithString:[self.headerListArr[nextIndex] pic]] forState:UIControlStateNormal];
                currentIndex = nextIndex;
                   self.foodNameLab.text = [self.headerListArr[currentIndex] name ];
            }
            
        }
        
        self.page.currentPage = currentIndex;
    }
    
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    if (scrollView == self.headScrollView) {
    [_tim setFireDate:[NSDate distantFuture]];
    }
}
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    if (scrollView == self.headScrollView) {
    [_tim setFireDate:[NSDate dateWithTimeIntervalSinceNow:2]];
    }
}

#pragma mark - Custom delegate methods 分类写好
-(void)move:(NSTimer *)tim{
 
    
    CGPoint point = self.headScrollView.contentOffset;
    point.x += SCREEN_WIDTH;
 
    [self.headScrollView setContentOffset:point animated:YES];
    
}
#pragma mark - Private methods 用类或类别实现一个小功能

#pragma mark - setters and getters
-(NSMutableArray *)listArr{
    if (!_listArr) {
        _listArr = [NSMutableArray new];
        
    }

    return _listArr;

}
-(NSMutableArray *)headerListArr{
    if (!_headerListArr) {
        _headerListArr = [NSMutableArray new];
        
    }
    
    return _headerListArr;
    
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

@end
