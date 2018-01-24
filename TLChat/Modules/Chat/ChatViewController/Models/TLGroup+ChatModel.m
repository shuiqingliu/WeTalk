
//
//  TLGroup+ChatModel.m
//  TLChat
//
//  Created by iOS Team on 16/5/6.
//  Copyright © 2017年 iOS Team. All rights reserved.
//

#import "TLGroup+ChatModel.h"

@implementation TLGroup (ChatModel)

- (NSString *)chat_userID
{
    return self.groupID;
}

- (NSString *)chat_username
{
    return self.groupName;
}

- (NSString *)chat_avatarURL
{
    return nil;
}

- (NSString *)chat_avatarPath
{
    return self.groupAvatarPath;
}

- (NSInteger)chat_userType
{
    return TLChatUserTypeGroup;
}

- (id)groupMemberByID:(NSString *)userID
{
    return [self memberByUserID:userID];
}

- (NSArray *)groupMembers
{
    return self.users;
}

@end
