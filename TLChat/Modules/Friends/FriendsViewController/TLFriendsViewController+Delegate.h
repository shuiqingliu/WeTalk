//
//  TLFriendsViewController+Delegate.h
//  TLChat
//
//  Created by iOS Team on 16/3/17.
//  Copyright © 2017年 iOS Team. All rights reserved.
//

#import "TLFriendsViewController.h"

#define     HEIGHT_FRIEND_CELL      54.0f
#define     HEIGHT_HEADER           22.0f

@interface TLFriendsViewController (Delegate) <UISearchBarDelegate>

- (void)registerCellClass;

@end
