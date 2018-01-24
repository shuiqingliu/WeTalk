//
//  TLUser+ChatModel.m
//  TLChat
//
//  Created by iOS Team on 16/5/6.
//  Copyright © 2017年 iOS Team. All rights reserved.
//

#import "TLUser+ChatModel.h"

@implementation TLUser (ChatModel)

- (NSString *)chat_userID
{
    return self.userID;
}

- (NSString *)chat_username
{
    return self.showName;
}

- (NSString *)chat_avatarURL
{
    return self.avatarURL;
}

- (NSString *)chat_avatarPath
{
    return self.avatarPath;
}

- (NSInteger)chat_userType
{
    return TLChatUserTypeUser;
}

@end
