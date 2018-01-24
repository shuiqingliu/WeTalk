
//
//  TLMessageCellDelegate.h
//  TLChat
//
//  Created by iOS Team on 16/3/2.
//  Copyright © 2017年 iOS Team. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol TLChatUserProtocol;
@class TLMessage;
@protocol TLMessageCellDelegate <NSObject>

- (void)messageCellDidClickAvatarForUser:(id<TLChatUserProtocol>)user;

- (void)messageCellTap:(TLMessage *)message;

- (void)messageCellLongPress:(TLMessage *)message rect:(CGRect)rect;

- (void)messageCellDoubleClick:(TLMessage *)message;

- (void)messageCellDidClickSendFailed:(TLMessage *)message;

@end
