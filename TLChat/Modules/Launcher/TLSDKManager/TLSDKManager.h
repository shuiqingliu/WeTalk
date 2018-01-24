//
//  TLSDKManager.h
//  TLChat
//
//  Created by iOS Team on 2017/9/20.
//  Copyright © 2017年 iOS Team. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TLSDKManager : NSObject

+ (TLSDKManager *)sharedInstance;

/**
 *  启动，初始化
 */
- (void)launchInWindow:(UIWindow *)window;

- (instancetype)init NS_UNAVAILABLE;
+ (instancetype)new NS_UNAVAILABLE;

@end
