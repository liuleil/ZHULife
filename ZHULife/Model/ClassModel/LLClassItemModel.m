//
//	LLClassItemModel.m
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "LLClassItemModel.h"

NSString *const kLLClassItemModelMsg = @"msg";
NSString *const kLLClassItemModelResult = @"result";
NSString *const kLLClassItemModelStatus = @"status";

@interface LLClassItemModel ()
@end
@implementation LLClassItemModel

// 返回容器类中的所需要存放的数据类型 (以 Class 或 Class Name 的形式)。
+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{kLLClassItemModelResult: [LLClassResult class]
             };
}
@end
