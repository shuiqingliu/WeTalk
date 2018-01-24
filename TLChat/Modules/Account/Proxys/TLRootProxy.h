//
//  TLRootProxy.h
//  TLChat
//
//  Created by iOS Team on 16/3/13.
//  Copyright © 2017年 iOS Team. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TLRootProxy : NSObject

- (void)requestClientInitInfoSuccess:(void (^)(id))clientInitInfo
                             failure:(void (^)(NSString *))error;

- (void)userLoginWithPhoneNumber:(NSString *)phoneNumber
                        password:(NSString *)password
                         success:(TLBlockRequestSuccessWithDatas)success
                         failure:(TLBlockRequestFailureWithErrorMessage)failure;


- (void)userRegisterWithPhoneNumber:(NSString *)phoneNumber
                           password:(NSString *)password
                            success:(TLBlockRequestSuccessWithDatas)success
                            failure:(TLBlockRequestFailureWithErrorMessage)failure;

@end
