//
//  TLConversation.m
//  TLChat
//
//  Created by iOS Team on 16/1/23.
//  Copyright © 2017年 iOS Team. All rights reserved.
//

#import "TLConversation.h"

@implementation TLConversation

- (void)setConvType:(TLConversationType)convType
{
    _convType = convType;
    switch (convType) {
        case TLConversationTypePersonal:
        case TLConversationTypeGroup:
            _clueType = TLClueTypePointWithNumber;
            break;
        case TLConversationTypePublic:
        case TLConversationTypeServerGroup:
            _clueType = TLClueTypePoint;
            break;
        default:
            break;
    }
}

- (BOOL)isRead
{
    return self.unreadCount == 0;
}

@end
