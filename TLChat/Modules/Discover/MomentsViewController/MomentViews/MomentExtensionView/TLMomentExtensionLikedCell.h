//
//  TLMomentExtensionLikedCell.h
//  TLChat
//
//  Created by iOS Team on 16/4/22.
//  Copyright © 2017年 iOS Team. All rights reserved.
//

#import "TLTableViewCell.h"

@interface TLMomentExtensionLikedCell : TLTableViewCell

@property (nonatomic, assign) BOOL showBottomLine;

@property (nonatomic, strong) NSArray *likedFriends;

@end
