#import "TLGroup.h"

@interface TLGroup (CreateAvatar)

- (void)createGroupAvatarWithCompleteAction:(void (^)(NSString *groupID))completeAction;

@end
