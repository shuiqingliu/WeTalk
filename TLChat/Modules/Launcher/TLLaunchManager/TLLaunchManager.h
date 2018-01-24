//
//  TLLaunchManager.h
//  TLChat
//
//  Created by iOS Team on 2017/9/19.
//  Copyright © 2017年 iOS Team. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <TLTabBarController/TLTabBarController.h>
#import "UITabBarController+TLLaunchExtension.h"

@interface TLLaunchManager : NSObject

/// 根控制器
@property (nonatomic, strong, readonly) TLTabBarController *rootVC;

+ (TLLaunchManager *)sharedInstance;

/**
 *  启动，初始化
 */
- (void)launchInWindow:(UIWindow *)window;

- (instancetype)init NS_UNAVAILABLE;
+ (instancetype)new NS_UNAVAILABLE;


@end
