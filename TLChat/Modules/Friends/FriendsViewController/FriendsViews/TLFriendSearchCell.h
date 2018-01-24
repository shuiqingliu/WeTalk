//
//  TLFriendSearchCell.h
//  TLChat
//
//  Created by caesar van on 2018/1/18.
//  Copyright © 2018年. All rights reserved.
//

#import "TLTableViewCell.h"
#import "TLConversation.h"
#import "TLUser.h"

@interface TLFriendSearchCell : TLTableViewCell

/**
 *  用户信息
 */
@property (nonatomic, strong) TLUser *user;
@property (nonatomic, strong) TLConversation *Conversation;
- (instancetype)initWithUserInfo:(NSString *)messageInfo;
@end
