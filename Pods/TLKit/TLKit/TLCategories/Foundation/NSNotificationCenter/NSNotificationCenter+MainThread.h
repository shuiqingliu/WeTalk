//
//  NSNotificationCenter+MainThread.h
//  TLKit
//
//  Created by iOS Team on 2017/9/11.
//  Copyright © 2017年 iOS Team. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSNotificationCenter (MainThread)

- (void)postNotificationOnMainThread:(NSNotification *)notification;

- (void)postNotificationOnMainThreadName:(NSString *)name object:(id)object;

- (void)postNotificationOnMainThreadName:(NSString *)name object:(id)object userInfo:(NSDictionary *)aUserInfo;

@end
