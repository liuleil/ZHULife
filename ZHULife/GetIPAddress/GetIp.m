//
//  GetIp.m
//  ZHULife
//
//  Created by leileigege on 2016/12/9.
//  Copyright © 2016年 leileigege. All rights reserved.
//

#import "GetIp.h"

#include <ifaddrs.h>
#include <arpa/inet.h>
@implementation GetIp

+ (NSString *)deviceIPAdress {
    NSString *address = @"网络错误，请检查网络";
    struct ifaddrs *interfaces = NULL;
    struct ifaddrs *temp_addr = NULL;
    int success = 0;
    
    success = getifaddrs(&interfaces);
    
    if (success == 0) { // 0 表示获取成功
        
        temp_addr = interfaces;
        while (temp_addr != NULL) {
            if( temp_addr->ifa_addr->sa_family == AF_INET) {
                // Check if interface is en0 which is the wifi connection on the iPhone
                if ([[NSString stringWithUTF8String:temp_addr->ifa_name] isEqualToString:@"en0"]) {
                    // Get NSString from C String
                    address = [NSString stringWithUTF8String:inet_ntoa(((struct sockaddr_in *)temp_addr->ifa_addr)->sin_addr)];
                }
            }
            
            temp_addr = temp_addr->ifa_next;
        }
    }
    
    freeifaddrs(interfaces);  
    
    NSLog(@"手机的IP是：%@", address);  
    return address;  
}
@end
