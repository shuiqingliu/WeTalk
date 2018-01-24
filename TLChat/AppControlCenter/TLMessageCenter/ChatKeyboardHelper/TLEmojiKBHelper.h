//
//  TLEmojiKBHelper.h
//  TLChat
//
//  Created by iOS Team on 16/2/20.
//  Copyright © 2017年 iOS Team. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TLEmojiGroup.h"

@interface TLEmojiKBHelper : NSObject

+ (TLEmojiKBHelper *)sharedKBHelper;

- (void)emojiGroupDataByUserID:(NSString *)userID complete:(void (^)(NSMutableArray *))complete;

- (void)updateEmojiGroupData;

@end
