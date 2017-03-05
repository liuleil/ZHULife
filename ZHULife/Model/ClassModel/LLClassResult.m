//
//	LLClassResult.m
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "LLClassResult.h"

NSString *const kLLClassResultClassid = @"classid";
NSString *const kLLClassResultList = @"list";
NSString *const kLLClassResultName = @"name";
NSString *const kLLClassResultParentid = @"parentid";

@interface LLClassResult ()
@end
@implementation LLClassResult
// 返回容器类中的所需要存放的数据类型 (以 Class 或 Class Name 的形式)。
+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{kLLClassResultList: [LLClassList class]
             };
}

@end
