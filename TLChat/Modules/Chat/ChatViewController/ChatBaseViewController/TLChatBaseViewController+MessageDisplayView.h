//
//  TLChatBaseViewController+MessageDisplayView.h
//  TLChat
//
//  Created by iOS Team on 16/3/17.
//  Copyright © 2017年 iOS Team. All rights reserved.
//

#import "TLChatBaseViewController.h"
#import "TLAudioPlayer.h"

#define     MAX_SHOWTIME_MSG_COUNT      10
#define     MAX_SHOWTIME_MSG_SECOND     30

@interface TLChatBaseViewController (MessageDisplayView) <TLChatMessageDisplayViewDelegate>

/**
 *  添加展示消息（添加到chatVC）
 */
- (void)addToShowMessage:(TLMessage *)message;

- (void)resetChatTVC;

@end
