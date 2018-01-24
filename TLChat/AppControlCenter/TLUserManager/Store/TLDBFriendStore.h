//
//  TLDBFriendStore.h
//  TLChat
//
//  Created by iOS Team on 16/3/22.
//  Copyright © 2017年 iOS Team. All rights reserved.
//

#import "TLDBBaseStore.h"

@class TLUser;
@interface TLDBFriendStore : TLDBBaseStore

- (BOOL)updateFriendsData:(NSArray *)friendData
                   forUid:(NSString *)uid;

- (BOOL)addFriend:(TLUser *)user forUid:(NSString *)uid;

- (NSMutableArray *)friendsDataByUid:(NSString *)uid;

- (BOOL)deleteFriendByFid:(NSString *)fid forUid:(NSString *)uid;

@end
