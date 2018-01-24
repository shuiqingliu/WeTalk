//
//  UIFont+TLChat.h
//  TLChat
//
//  Created by iOS Team on 16/1/27.
//  Copyright © 2017年 iOS Team. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIFont (TLChat)

#pragma mark - Common
+ (UIFont *)fontNavBarTitle;

#pragma mark - Conversation
+ (UIFont *)fontConversationUsername;
+ (UIFont *)fontConversationDetail;
+ (UIFont *)fontConversationTime;

#pragma mark - Friends
+ (UIFont *)fontFriendsUsername;

#pragma mark - Mine
+ (UIFont *)fontMineNikename;
+ (UIFont *)fontMineUsername;

#pragma mark - Setting
+ (UIFont *)fontSettingHeaderAndFooterTitle;


#pragma mark - Chat
+ (UIFont *)fontTextMessageText;

@end
