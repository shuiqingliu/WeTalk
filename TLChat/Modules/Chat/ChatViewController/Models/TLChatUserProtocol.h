//
//  TLChatUserProtocol.h
//  TLChat
//
//  Created by iOS Team on 16/5/6.
//  Copyright © 2017年 iOS Team. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, TLChatUserType) {
    TLChatUserTypeUser = 0,
    TLChatUserTypeGroup,
};


@protocol TLChatUserProtocol <NSObject>

@property (nonatomic, strong, readonly) NSString *chat_userID;

@property (nonatomic, strong, readonly) NSString *chat_username;

@property (nonatomic, strong, readonly) NSString *chat_avatarURL;

@property (nonatomic, strong, readonly) NSString *chat_avatarPath;

@property (nonatomic, assign, readonly) NSInteger chat_userType;

@optional;
- (id)groupMemberByID:(NSString *)userID;

- (NSArray *)groupMembers;

@end
