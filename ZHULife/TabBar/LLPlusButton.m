//
//  LLPlusButton.m

//
//  Created by leileigege on 2016/12/4.
//  Copyright © 2016年 hehe. All rights reserved.
//

#import "LLPlusButton.h"
//#import "ShareViewController.h"

@implementation LLPlusButton

#pragma mark - CYLPlusButtonSubclassing
//@required
+ (id)plusButton
{
    LLPlusButton *button = [[LLPlusButton alloc] init];
    button.frame = CGRectMake(0, 0, 60, 60);
    [button setBackgroundImage:[UIImage imageNamed:@"post_animate_add"] forState:UIControlStateNormal];

    
      [button addTarget:button action:@selector(clickPublish) forControlEvents:UIControlEventTouchUpInside];

    
    return button;
}

// @optional

+ (NSUInteger)indexOfPlusButtonInTabBar
{
    return 2;
}
-(void)clickPublish{
    [self initBlackViewAndButton];
    [self initLable];

}


#pragma mark - initViews
-(void)initBlackViewAndButton{

    _blackView = [UIView new];
    _blackView.frame  = CGRectMake(0, 0, SCREEN_WIDTH,SCREEN_HEIGHT);
    _blackView.backgroundColor = [UIColor blackColor];
    _blackView.alpha = 0.8;
    
    [[[UIApplication sharedApplication].delegate window] addSubview:_blackView];
    
    
    self.qqBtn.bounds = CGRectMake(0, 0, 60, 60);
    self.qqBtn.center = CGPointMake(SCREEN_WIDTH/2.0, SCREEN_HEIGHT-32);
    
    [self.qqBtn setBackgroundImage:[UIImage imageNamed:@"shareQQ"] forState:UIControlStateNormal];
    [[[UIApplication sharedApplication].delegate  window ] addSubview:self.qqBtn];
    
    
    self.weiXinBtn.bounds = CGRectMake(0, 0, 60, 60);
    self.weiXinBtn.center = CGPointMake(SCREEN_WIDTH/2.0, SCREEN_HEIGHT-32);
    
    [self.weiXinBtn setBackgroundImage:[UIImage imageNamed:@"shareWeiXin"] forState:UIControlStateNormal];
    [[[UIApplication sharedApplication].delegate  window ] addSubview:self.weiXinBtn];
    
    
    
    
    self.weiBoBtn.bounds = CGRectMake(0, 0, 60, 60);
    self.weiBoBtn.center = CGPointMake(SCREEN_WIDTH/2.0, SCREEN_HEIGHT-32);
    
    [self.weiBoBtn setBackgroundImage:[UIImage imageNamed:@"shareWeiBo"] forState:UIControlStateNormal];
    [[[UIApplication sharedApplication].delegate  window ] addSubview:self.weiBoBtn];
    _buttomBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _buttomBtn.bounds = CGRectMake(0, 0, 60, 60);
    _buttomBtn.alpha =1;
    [_buttomBtn setImage:[UIImage imageNamed:@"post_animate_add"] forState:UIControlStateNormal];
    [_buttomBtn addTarget:self action:@selector(buttonBtnPress) forControlEvents:UIControlEventTouchUpInside];
    [[[UIApplication sharedApplication].delegate window] addSubview:_buttomBtn];
    [_buttomBtn makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(_blackView.bottom).offset(-2);
        make.centerX.equalTo(_blackView.centerX);
    }];
    
    
    [UIView animateWithDuration:0.2 animations:^{
        _buttomBtn.transform=CGAffineTransformMakeRotation(M_PI/4);
        self.qqBtn.center = CGPointMake(35, SCREEN_HEIGHT-140);
        self.weiXinBtn.center = CGPointMake(SCREEN_WIDTH-35, SCREEN_HEIGHT-140);
        self.weiBoBtn.center =   CGPointMake(SCREEN_WIDTH/2.0, SCREEN_HEIGHT-160);
        
        
    } completion:^(BOOL finished) {
       
    }];
}
-(void)initLable{
    self.topLable.text = @"分享一下成果吧";
    self.topLable.font = [UIFont systemFontOfSize:20];
    self.topLable.frame = CGRectMake(0, 64, SCREEN_WIDTH, 30);
    self.topLable.textAlignment = NSTextAlignmentCenter;
    self.topLable.textColor = [UIColor whiteColor];
    [[[UIApplication sharedApplication].delegate  window ] addSubview:self.topLable];
    

}


#pragma mark - Event Response
-(void)buttonBtnPress{
    NSLog(@"按了 按了");

    [UIView animateWithDuration:0.2 animations:^{
        _buttomBtn.transform=CGAffineTransformMakeRotation(0);
         self.qqBtn.center = CGPointMake(SCREEN_WIDTH/2.0, SCREEN_HEIGHT-32);
          self.weiXinBtn.center = CGPointMake(SCREEN_WIDTH/2.0, SCREEN_HEIGHT-32);
        self.weiBoBtn.center = CGPointMake(SCREEN_WIDTH/2.0, SCREEN_HEIGHT-32);
        
        
    } completion:^(BOOL finished) {
        [self.blackView removeFromSuperview];
        [self.buttomBtn removeFromSuperview];
        [self.topLable removeFromSuperview];
        [self.qqBtn removeFromSuperview];
        [self.weiXinBtn removeFromSuperview];
        [self.weiBoBtn removeFromSuperview];
  
    }];
}
#pragma mark - Private methods
#pragma mark - setters and getters
-(UILabel *)topLable{
    if (!_topLable) {
        _topLable = [UILabel new];
        
    }
    return _topLable;

}
-(UIButton *)qqBtn{
    if (!_qqBtn) {
        _qqBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    }
    return _qqBtn;

}
-(UIButton *)weiXinBtn{
    if (!_weiXinBtn) {
        _weiXinBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    }
    return _weiXinBtn;
}

-(UIButton *)weiBoBtn{
    if (!_weiBoBtn) {
        _weiBoBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    }
    return _weiBoBtn;
}



@end
