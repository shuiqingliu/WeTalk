//
//  TLChatMacros.h
//  TLChat
//
//  Created by iOS Team on 16/2/19.
//  Copyright © 2017年 iOS Team. All rights reserved.
//

#ifndef TLChatMacros_h
#define TLChatMacros_h
#import <UIKit/UIKit.h>

#define     HEIGHT_CHATBAR_TEXTVIEW         36.0f
#define     HEIGHT_MAX_CHATBAR_TEXTVIEW     111.5f
#define     HEIGHT_CHAT_KEYBOARD            215.0f

typedef NS_ENUM(NSInteger, TLEmojiType) {
    TLEmojiTypeEmoji,
    TLEmojiTypeFavorite,
    TLEmojiTypeFace,
    TLEmojiTypeImage,
    TLEmojiTypeImageWithTitle,
    TLEmojiTypeOther,
};

typedef NS_ENUM(NSInteger, TLChatBarStatus) {
    TLChatBarStatusInit,
    TLChatBarStatusVoice,
    TLChatBarStatusEmoji,
    TLChatBarStatusMore,
    TLChatBarStatusKeyboard,
};


#endif /* TLChatMacros_h */
