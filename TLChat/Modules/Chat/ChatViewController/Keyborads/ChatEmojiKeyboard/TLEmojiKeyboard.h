//
//  TLEmojiKeyboard.h
//  TLChat
//
//  Created by iOS Team on 16/2/17.
//  Copyright © 2017年 iOS Team. All rights reserved.
//

#import "TLBaseKeyboard.h"
#import "TLEmojiKeyboardDelegate.h"
#import "TLEmojiGroupControl.h"
#import "TLEmojiGroupDisplayView.h"

@interface TLEmojiKeyboard : TLBaseKeyboard

@property (nonatomic, assign) NSMutableArray *emojiGroupData;

@property (nonatomic, assign) id<TLEmojiKeyboardDelegate> delegate;

@property (nonatomic, strong) TLEmojiGroup *curGroup;

@property (nonatomic, strong) TLEmojiGroupDisplayView *displayView;

@property (nonatomic, strong) UIPageControl *pageControl;

@property (nonatomic, strong) TLEmojiGroupControl *groupControl;

+ (TLEmojiKeyboard *)keyboard;

@end
