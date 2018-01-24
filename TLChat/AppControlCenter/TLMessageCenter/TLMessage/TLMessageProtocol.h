//
//  TLMessageProtocol.h
//  TLChat
//
//  Created by libokun on 16/3/28.
//  Copyright © 2017年 iOS Team. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TLMessageFrame.h"

@protocol TLMessageProtocol <NSObject>

- (NSString *)messageCopy;

- (NSString *)conversationContent;

@end
