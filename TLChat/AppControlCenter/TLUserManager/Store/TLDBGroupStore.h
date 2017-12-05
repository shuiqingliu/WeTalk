#import "TLDBBaseStore.h"
#import "TLGroup.h"

@interface TLDBGroupStore : TLDBBaseStore

- (BOOL)updateGroupsData:(NSArray *)groupData
                   forUid:(NSString *)uid;

- (BOOL)addGroup:(TLGroup *)group forUid:(NSString *)uid;


- (NSMutableArray *)groupsDataByUid:(NSString *)uid;

- (BOOL)deleteGroupByGid:(NSString *)gid forUid:(NSString *)uid;

@end
