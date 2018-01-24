//
//  TLUserGroupCell.h
//  TLChat
//
//  Created by iOS Team on 16/3/6.
//  Copyright © 2017年 iOS Team. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TLUser;
@protocol TLUserGroupCellDelegate <NSObject>

- (void)userGroupCellDidSelectUser:(TLUser *)user;

- (void)userGroupCellAddUserButtonDown;

@end

@interface TLUserGroupCell : UITableViewCell

@property (nonatomic, assign) id<TLUserGroupCellDelegate>delegate;

@property (nonatomic, strong) NSMutableArray *users;


@end
