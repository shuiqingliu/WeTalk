//
//  TLUserGroupItemCell.h
//  TLChat
//
//  Created by iOS Team on 16/3/6.
//  Copyright © 2017年 iOS Team. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TLUser;
@interface TLUserGroupItemCell : UICollectionViewCell

@property (nonatomic, strong) TLUser *user;

@property (nonatomic, strong) void (^clickBlock)(TLUser *user);

@end
