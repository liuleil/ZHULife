//
//  ClassifyViewController.m
//  ZHULife
//
//  Created by leileigege on 2016/12/13.
//  Copyright © 2016年 leileigege. All rights reserved.
//

#import "ClassifyViewController.h"
#import "RequestBase.h"
#import "LLClassItemModel.h"
#import "DetailedClassificationViewController.h"
@interface LLButton : UIButton

@property (nonatomic, assign) int point;
@end
@implementation LLButton

@end
@interface ClassifyViewController ()
@property(nonatomic,strong) UIImageView *centerImage;
@property(nonatomic,strong) NSTimer *tim;
@property(nonatomic,strong) NSMutableArray *btnArr;
@property(nonatomic,copy) NSArray *resultArr;
@property(nonatomic,strong) UIStoryboard *storybord;
@end

@implementation ClassifyViewController
#pragma mark - life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
 
    
  self.navigationController.interactivePopGestureRecognizer.enabled = YES;
   self.navigationController.interactivePopGestureRecognizer.delegate = nil;  
    [self.navigationController.navigationBar setBarTintColor:[UIColor colorWithRed:20/255.0 green:155/255.0 blue:213/255.0 alpha:1.0]];
    [self.navigationController.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor],NSForegroundColorAttributeName,nil]];
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"菜谱分类";
    [self request];

    
}
-(void)viewWillAppear:(BOOL)animated{


 self.tabBarController.tabBar.hidden=NO;
}
#pragma mark - initViews
-(void)initCentermage{
    self.centerImage = [UIImageView new];
    self.centerImage.bounds = CGRectMake(0, 0, SCREEN_WIDTH/10.0, SCREEN_HEIGHT/10.0);
    self.centerImage.center = self.view.center;
    self.centerImage.image = [UIImage imageNamed:@"centerArrows"];
    
    [self.view addSubview:self.centerImage];
    
}
-(void)initClassBtn{

    for (int i = 0;  i < 12; i++) {
        LLButton *choseButton = [LLButton buttonWithType:UIButtonTypeCustom];
        choseButton.center = CGPointMake(SCREEN_WIDTH/2+ (SCREEN_WIDTH/2.5)*cos(M_PI/180*(360/12.0*i)), SCREEN_HEIGHT/2+ (SCREEN_WIDTH/2.5)*sin(M_PI/180*((360/12.0)*i)));
        choseButton.bounds = CGRectMake(0, 0, SCREEN_WIDTH/7.0 ,SCREEN_WIDTH/7.0);
        choseButton.tag = i;
        choseButton.point = (360/12)*i;
        [choseButton setBackgroundImage:[UIImage imageNamed:@"classBtnBackground"] forState:UIControlStateNormal];
        if (i<11) {
              [choseButton setTitle:[self.resultArr[i] name] forState:UIControlStateNormal];
        }
        else{
            [choseButton setTitle:@"所有" forState:UIControlStateNormal];
        
        }
        
        choseButton.titleLabel.font = [UIFont systemFontOfSize: 10.0];
        [choseButton setTitleColor:[UIColor blackColor]forState:UIControlStateNormal];
//        choseButton.titleLabel.textColor = [UIColor blueColor];
//        [choseButton setBackgroundColor: [UIColor blueColor]];
//        [choseButton setTintColor:[UIColor blueColor]];
//        [choseButton setImage:[UIImage imageNamed:@"classBtnBackground"] forState:UIControlStateNormal];
        [choseButton addTarget:self action:@selector(itemClicked:) forControlEvents:UIControlEventTouchUpInside];
        
        [self.view addSubview: choseButton];
         [self.btnArr addObject:choseButton];
        
        
        
    }




}
#pragma mark - delegate methods
-(void)request{
    [RequestBase getReuqestWithPath: @"http://jisusrecipe.market.alicloudapi.com/recipe/class" parameters:nil completionHandler:^(id responseObj, NSError *error) {
        LLClassItemModel *classItemModel = [LLClassItemModel yy_modelWithJSON:responseObj];
        if ([classItemModel.status isEqualToString:@"0"]) {
            self.resultArr = classItemModel.result;
            
            [self initCentermage];
            [self initClassBtn];
            
            
        }
       
        
   
        
    }];






}
#pragma mark - delegate methods 
#pragma mark UITableViewDatasource
#pragma mark UITableViewDelegate
#pragma mark UIScrollViewDelegate
#pragma mark - Custom delegate methods
#pragma mark - Event Response
int num;
- (void)itemClicked:(LLButton *)btn
{
    if (_tim) {
        return;
    }
    num = btn.point%360;
    _tim = [NSTimer scheduledTimerWithTimeInterval:.02 target:self selector:@selector(move) userInfo:btn repeats:YES];
}
#pragma mark - Private methods 
- (void)move
{
    num = [_tim.userInfo   point];
    if (num%360 == 270) {
        
        [self pushWithBtn:_tim.userInfo];
        
        
        [_tim invalidate];
        _tim = nil;
        num=0;
        return;
    }
   
    for (LLButton *btn in _btnArr) {
        btn.point += 10;
        
        btn.center = CGPointMake(SCREEN_WIDTH/2.0 + (SCREEN_WIDTH/2.5) * cos(btn.point * M_PI/180), SCREEN_HEIGHT/2.0 + (SCREEN_WIDTH/2.5) * sin(btn.point * M_PI/180));
    }
    
}
-(void )pushWithBtn:(LLButton *)btn{
    DetailedClassificationViewController *detailedClassificationViewController =[self.storybord instantiateViewControllerWithIdentifier:@"DetailedClassificationViewcontroller"];
    if (btn.tag <11) {
        detailedClassificationViewController.classListArr = [self.resultArr[btn.tag] list];
        detailedClassificationViewController.titleStr = [self.resultArr[btn.tag] name];
    }
  
    [self.navigationController pushViewController:detailedClassificationViewController animated:YES];


}
#pragma mark - setters and getters
-(NSMutableArray *)btnArr{
    if (!_btnArr) {
        _btnArr = [NSMutableArray new];
        
    }

    return  _btnArr;

}
-(UIStoryboard *)storybord{
    if (!_storybord) {
        _storybord = [UIStoryboard storyboardWithName:@"LLStoryboard" bundle:[NSBundle mainBundle]];
    }
    return _storybord;



}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
 
}

@end
