//
//  TLMessageManager+ConversationRecord.h
//  TLChat
//
//  Created by iOS Team on 16/3/20.
//  Copyright © 2017年 iOS Team. All rights reserved.
//

#import "TLMessageManager.h"

@interface TLMessageManager (ConversationRecord)

- (BOOL)addConversationByMessage:(TLMessage *)message;

- (void)conversationRecord:(void (^)(NSArray *))complete;

- (BOOL)deleteConversationByPartnerID:(NSString *)partnerID;

@end
