//
//  TLMessageManager.h
//  TLChat
//
//  Created by iOS Team on 16/3/13.
//  Copyright © 2017年 iOS Team. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TLDBMessageStore.h"
#import "TLDBConversationStore.h"
#import "TLMessage.h"

#import "TLMessageManagerChatVCDelegate.h"
#import "TLMessageManagerConvVCDelegate.h"

@interface TLMessageManager : NSObject

@property (nonatomic, assign) id<TLMessageManagerChatVCDelegate>messageDelegate;
@property (nonatomic, assign) id<TLMessageManagerConvVCDelegate>conversationDelegate;

@property (nonatomic, strong, readonly) NSString *userID;

@property (nonatomic, strong) TLDBMessageStore *messageStore;

@property (nonatomic, strong) TLDBConversationStore *conversationStore;

+ (TLMessageManager *)sharedInstance;

#pragma mark - 发送
- (void)sendMessage:(TLMessage *)message
           progress:(void (^)(TLMessage *, CGFloat))progress
            success:(void (^)(TLMessage *))success
            failure:(void (^)(TLMessage *))failure;


@end
