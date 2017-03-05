//
//  CollectModel.h
//  ZHULife
//
//  Created by leileigege on 2016/12/28.
//  Copyright © 2016年 leileigege. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CollectModel : NSObject<NSCoding>
@property(nonatomic,copy) NSString *foodName;
@property(nonatomic,strong) UIImage *foodImage;
@property(nonatomic,copy) NSString *foodId;
@end
