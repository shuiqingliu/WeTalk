//
//  TLGroup+CreateAvatar.h
//  TLChat
//
//  Created by iOS Team on 2017/9/19.
//  Copyright © 2017年 iOS Team. All rights reserved.
//

#import "TLGroup.h"

@interface TLGroup (CreateAvatar)

- (void)createGroupAvatarWithCompleteAction:(void (^)(NSString *groupID))completeAction;

@end
