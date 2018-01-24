//
//  TLFriendCell.h
//  TLChat
//
//  Created by iOS Team on 16/1/26.
//  Copyright © 2017年 iOS Team. All rights reserved.
//

#import "TLTableViewCell.h"

#import "TLUser.h"

@interface TLFriendCell : TLTableViewCell

/**
 *  用户信息
 */
@property (nonatomic, strong) TLUser *user;

@end
