//
//  TLNewFriendViewController+Delegate.h
//  TLChat
//
//  Created by iOS Team on 16/3/17.
//  Copyright © 2017年 iOS Team. All rights reserved.
//

#import "TLNewFriendViewController.h"
#import "TLAddThirdPartFriendCell.h"

@interface TLNewFriendViewController (Delegate) <UISearchBarDelegate, TLAddThirdPartFriendCellDelegate>

- (void)registerCellClass;

@end
