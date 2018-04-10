//
//  TLChatBaseViewController+ChatBar.h
//  TLChat
//
//  Created by iOS Team on 16/3/17.
//  Copyright © 2017年 iOS Team. All rights reserved.
//

#import "TLChatBaseViewController.h"
#import "TLMoreKeyboard.h"
#import "TLEmojiKeyboard.h"
#import "FileViewController.h"
#import "MessageTrans.h"
#import "TLDBGroupStore.h"
#import "TLDBGroupSQL.h"
#import "TLGroup.h"

@interface TLChatBaseViewController (ChatBar) <TLChatBarDelegate, TLKeyboardDelegate, TLEmojiKeyboardDelegate,FileSendDelegate,receiveDelegate>

/// 表情键盘
@property (nonatomic, strong, readonly) TLEmojiKeyboard *emojiKeyboard;

/// 更多键盘
@property (nonatomic, strong, readonly) TLMoreKeyboard *moreKeyboard;

@property (nonatomic, strong) TLDBGroupStore *groupStore;

- (void)loadKeyboard;
- (void)dismissKeyboard;

- (void)keyboardWillShow:(NSNotification *)notification;
- (void)keyboardDidShow:(NSNotification *)notification;
- (void)keyboardWillHide:(NSNotification *)notification;
- (void)keyboardFrameWillChange:(NSNotification *)notification;

//实现receiveDelegate代理协议
-(void) receiveMessage:(TLMessage *)message;


@end
