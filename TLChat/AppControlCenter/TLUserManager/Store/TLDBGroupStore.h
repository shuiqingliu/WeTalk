//
//  TLDBGroupStore.h
//  TLChat
//
//  Created by iOS Team on 16/4/17.
//  Copyright © 2017年 iOS Team. All rights reserved.
//

#import "TLDBBaseStore.h"
#import "TLGroup.h"

@interface TLDBGroupStore : TLDBBaseStore

- (BOOL)updateGroupsData:(NSArray *)groupData
                   forUid:(NSString *)uid;

- (BOOL)addGroup:(TLGroup *)group forUid:(NSString *)uid;


- (NSMutableArray *)groupsDataByUid:(NSString *)uid;

- (BOOL)deleteGroupByGid:(NSString *)gid forUid:(NSString *)uid;

//瞎gao


- (NSMutableArray *)groupMembersForUid:(NSString *)uid andGid:(NSString *)gid;

//添加群成员wky
- (BOOL)addGroupMember:(TLUser *)user forUid:(NSString *)uid andGid:(NSString *)gid;

//添加一堆群成员wky
- (BOOL)addGroupMembers:(NSArray *)users forUid:(NSString *)uid andGid:(NSString *)gid;


@end
