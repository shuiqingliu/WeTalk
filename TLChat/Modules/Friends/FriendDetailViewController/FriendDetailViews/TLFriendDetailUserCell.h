//
//  TLFriendDetailUserCell.h
//  TLChat
//
//  Created by iOS Team on 16/2/29.
//  Copyright © 2017年 iOS Team. All rights reserved.
//

#import "TLTableViewCell.h"
#import "TLInfo.h"

@protocol TLFriendDetailUserCellDelegate <NSObject>

- (void)friendDetailUserCellDidClickAvatar:(TLInfo *)info;

@end

@interface TLFriendDetailUserCell : TLTableViewCell

@property (nonatomic, assign) id<TLFriendDetailUserCellDelegate>delegate;

@property (nonatomic, strong) TLInfo *info;

@end
