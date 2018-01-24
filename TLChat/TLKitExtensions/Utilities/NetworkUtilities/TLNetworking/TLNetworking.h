//
//  TLNetworking.h
//  TLChat
//
//  Created by iOS Team on 16/4/3.
//  Copyright © 2017年 iOS Team. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TLNetworking : NSObject

+ (NSURLSessionDataTask *)postUrl:(NSString *)urlString
                       parameters:(id)parameters
                          success:(void (^)(NSURLSessionDataTask *task, id responseObject))success
                          failure:(void (^)(NSURLSessionDataTask *task, NSError *error))failure;


@end
