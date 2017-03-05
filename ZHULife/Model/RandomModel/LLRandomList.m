//
//	LLRandomList.m
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "LLRandomList.h"

NSString *const kLLRandomListClassid = @"classid";
NSString *const kLLRandomListContent = @"content";
NSString *const kLLRandomListCookingtime = @"cookingtime";
NSString *const kLLRandomListIdField = @"id";
NSString *const kLLRandomListMaterial = @"material";
NSString *const kLLRandomListName = @"name";
NSString *const kLLRandomListPeoplenum = @"peoplenum";
NSString *const kLLRandomListPic = @"pic";
NSString *const kLLRandomListPreparetime = @"preparetime";
NSString *const kLLRandomListProcess = @"process";
NSString *const kLLRandomListTag = @"tag";

@interface LLRandomList ()
@end
@implementation LLRandomList
// 返回容器类中的所需要存放的数据类型 (以 Class 或 Class Name 的形式)。
+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"material" : [LLRandomMaterial class],@"process" : [LLRandomProces class]
             };
}
+ (NSDictionary *)modelCustomPropertyMapper {
    return @{@"idField" : kLLRandomListIdField
           };
}
@end
