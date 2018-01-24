//
//  TLConversation+TLUser.h
//  TLChat
//
//  Created by iOS Team on 16/3/21.
//  Copyright © 2017年 iOS Team. All rights reserved.
//

#import "TLConversation.h"
#import "TLUser+ChatModel.h"
#import "TLGroup+ChatModel.h"

@interface TLConversation (TLUser)

- (void)updateUserInfo:(TLUser *)user;

- (void)updateGroupInfo:(TLGroup *)group;

@end
