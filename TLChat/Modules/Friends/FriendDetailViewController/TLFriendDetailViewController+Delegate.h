//
//  TLFriendDetailViewController+Delegate.h
//  TLChat
//
//  Created by iOS Team on 16/3/17.
//  Copyright © 2017年 iOS Team. All rights reserved.
//

#import "TLFriendDetailViewController.h"
#import "TLFriendDetailUserCell.h"

#define     HEIGHT_USER_CELL           90.0f
#define     HEIGHT_ALBUM_CELL          80.0f

@interface TLFriendDetailViewController (Delegate) <TLFriendDetailUserCellDelegate>

- (void)registerCellClass;

@end
