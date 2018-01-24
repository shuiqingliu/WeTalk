//
//  TLFriendsViewController.h
//  TLChat
//
//  Created by iOS Team on 16/1/23.
//  Copyright © 2017年 iOS Team. All rights reserved.
//

#import "TLTableViewController.h"
#import "TLFriendSearchViewController.h"

@interface TLFriendsViewController : TLTableViewController

@property (nonatomic, weak) NSMutableArray *data;

@property (nonatomic, weak) NSMutableArray *sectionHeaders;

@property (nonatomic, strong) TLFriendSearchViewController *searchVC;

@end
