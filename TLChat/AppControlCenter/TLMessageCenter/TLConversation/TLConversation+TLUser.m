//
//  TLConversation+TLUser.m
//  TLChat
//
//  Created by iOS Team on 16/3/21.
//  Copyright © 2017年 iOS Team. All rights reserved.
//

#import "TLConversation+TLUser.h"

@implementation TLConversation (TLUser)

- (void)updateUserInfo:(TLUser *)user
{
    self.partnerName = user.showName;
    self.avatarPath = user.avatarPath;
    self.avatarURL = user.avatarURL;
}

- (void)updateGroupInfo:(TLGroup *)group
{
    self.partnerName = group.groupName;
    self.avatarPath = group.groupAvatarPath;
}

@end
