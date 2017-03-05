//
//  CollectModel.m
//  ZHULife
//
//  Created by leileigege on 2016/12/28.
//  Copyright © 2016年 leileigege. All rights reserved.
//

#import "CollectModel.h"

@implementation CollectModel
#pragma mark NSCoding
//对对象进行归档的时候其实就是存取对象的属性
//进行编码的时候会调用,做存储操作的时候会调用这个方法
- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:self.foodName forKey:@"foodName"];
    [aCoder encodeObject:self.foodId forKey:@"foodId"];
    [aCoder encodeObject:self.foodImage forKey:@"foodImage"];
}
//进行解码的时候会调用,做读取操作的时候会调用这个方法
- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super init];
    if (self) {
        self.foodName = [aDecoder decodeObjectForKey:@"foodName"];
        self.foodId = [aDecoder decodeObjectForKey:@"foodId"];
        self.foodImage = [aDecoder decodeObjectForKey:@"foodImage"];
    }
    return self;
}
@end
