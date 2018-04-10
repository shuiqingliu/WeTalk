//
//  TLChatBaseViewController+Proxy.m
//  TLChat
//
//  Created by iOS Team on 16/3/17.
//  Copyright © 2017年 iOS Team. All rights reserved.
//

#import "TLChatBaseViewController+Proxy.h"
#import "TLChatBaseViewController+MessageDisplayView.h"
#import "TLUserHelper.h"

@implementation TLChatBaseViewController (Proxy)

- (void)sendMessage:(TLMessage *)message
{
    message.ownerTyper = TLMessageOwnerTypeSelf;
    message.userID = [TLUserHelper sharedHelper].userID;
    message.fromUser = (id<TLChatUserProtocol>)[TLUserHelper sharedHelper].user;
    message.date = [NSDate date];
    
    if ([self.partner chat_userType] == TLChatUserTypeUser) {
        message.partnerType = TLPartnerTypeUser;
        message.friendID = [self.partner chat_userID];
    }
    else if ([self.partner chat_userType] == TLChatUserTypeGroup) {
        message.partnerType = TLPartnerTypeGroup;
        message.groupID = [self.partner chat_userID];
    }
    
    if (message.messageType != TLMessageTypeVoice) {
        [self addToShowMessage:message];    // 添加到列表
    }
    else {
        [self.messageDisplayView updateMessage:message];
    }
    
    [[TLMessageManager sharedInstance] sendMessage:message progress:^(TLMessage * message, CGFloat pregress) {
        
    } success:^(TLMessage * message) {
        NSLog(@"send success");
    } failure:^(TLMessage * message) {
        NSLog(@"send failure");
    }];
}

- (void)receivedMessage:(TLMessage *)message
{
    message.userID = [TLUserHelper sharedHelper].userID;
    if ([self.partner chat_userType] == TLChatUserTypeUser) {
        NSLog(@"确认收到一条单聊消息");
        message.partnerType = TLPartnerTypeUser;
        message.friendID = [self.partner chat_userID];
    }
    else if ([self.partner chat_userType] == TLChatUserTypeGroup) {
        NSLog(@"确认收到一条群消息");
        message.partnerType = TLPartnerTypeGroup;
        message.groupID = [self.partner chat_userID];
    }
    message.ownerTyper = TLMessageOwnerTypeFriend;
    message.date = [NSDate date];
    [self addToShowMessage:message];    // 添加到列表
    
    [[TLMessageManager sharedInstance] sendMessage:message progress:^(TLMessage * message, CGFloat pregress) {
        
    } success:^(TLMessage * message) {
        NSLog(@"send success");
    } failure:^(TLMessage * message) {
        NSLog(@"send failure");
    }];
}

@end
