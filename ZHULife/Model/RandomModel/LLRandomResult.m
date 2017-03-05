//
//	LLRandomResult.m
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "LLRandomResult.h"

NSString *const kLLRandomResultList = @"list";
NSString *const kLLRandomResultNum = @"num";

@interface LLRandomResult ()
@end
@implementation LLRandomResult
// 返回容器类中的所需要存放的数据类型 (以 Class 或 Class Name 的形式)。
+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"list" : [LLRandomList class]
             };
}

@end
