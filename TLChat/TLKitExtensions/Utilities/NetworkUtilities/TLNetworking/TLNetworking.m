//
//  TLNetworking.m
//  TLChat
//
//  Created by iOS Team on 16/4/3.
//  Copyright © 2017年 iOS Team. All rights reserved.
//

#import "TLNetworking.h"
#import <AFNetworking.h>

@implementation TLNetworking

+ (NSURLSessionDataTask *)postUrl:(NSString *)urlString
                       parameters:(id)parameters
                          success:(void (^)(NSURLSessionDataTask *, id))success
                          failure:(void (^)(NSURLSessionDataTask *, NSError *))failure
{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    return [manager POST:urlString parameters:parameters progress:nil success:success failure:failure];
}

@end
