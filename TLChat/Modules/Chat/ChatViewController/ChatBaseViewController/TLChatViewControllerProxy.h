//
//  TLChatViewControllerProxy.h
//  TLChat
//
//  Created by iOS Team on 16/5/1.
//  Copyright © 2017年 iOS Team. All rights reserved.
//

#import <Foundation/Foundation.h>

@class TLUser;
@class TLImageMessage;
@protocol TLChatViewControllerProxy <NSObject>

@optional;
- (void)didClickedUserAvatar:(TLUser *)user;

- (void)didClickedImageMessages:(NSArray *)imageMessages atIndex:(NSInteger)index;

@end
