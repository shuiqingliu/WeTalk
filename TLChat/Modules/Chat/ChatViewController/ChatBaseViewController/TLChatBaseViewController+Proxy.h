//
//  TLChatBaseViewController+Proxy.h
//  TLChat
//
//  Created by iOS Team on 16/3/17.
//  Copyright © 2017年 iOS Team. All rights reserved.
//

#import "TLChatBaseViewController.h"

@interface TLChatBaseViewController (Proxy)

/**
 *  发送消息
 */
- (void)sendMessage:(TLMessage *)message;


/**
 *  接收到消息
 *
 *  临时写法
 */
- (void)receivedMessage:(TLMessage *)message;

@end
