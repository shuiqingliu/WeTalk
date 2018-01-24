//
//  TLFriendHelper+Detail.h
//  TLChat
//
//  Created by iOS Team on 16/3/7.
//  Copyright © 2017年 iOS Team. All rights reserved.
//

#import "TLFriendHelper.h"

@interface TLFriendHelper (Detail)

- (NSMutableArray *)friendDetailArrayByUserInfo:(TLUser *)userInfo;

- (NSMutableArray *)friendDetailSettingArrayByUserInfo:(TLUser *)userInfo;

@end
