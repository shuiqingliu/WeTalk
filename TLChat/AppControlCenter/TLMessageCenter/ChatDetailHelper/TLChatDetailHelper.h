//
//  TLChatDetailHelper.h
//  TLChat
//
//  Created by iOS Team on 16/3/6.
//  Copyright © 2017年 iOS Team. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TLSettingGroup.h"
#import "TLGroup.h"

@interface TLChatDetailHelper : NSObject

- (NSMutableArray *)chatDetailDataByUserInfo:(TLUser *)userInfo;

- (NSMutableArray *)chatDetailDataByGroupInfo:(TLGroup *)groupInfo;

@end
