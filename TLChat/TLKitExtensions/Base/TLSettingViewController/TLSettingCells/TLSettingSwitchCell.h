//
//  TLSettingSwitchCell.h
//  TLChat
//
//  Created by iOS Team on 16/2/10.
//  Copyright © 2017年 iOS Team. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TLSettingItem.h"

@protocol TLSettingSwitchCellDelegate <NSObject>
@optional
- (void)settingSwitchCellForItem:(TLSettingItem *)settingItem didChangeStatus:(BOOL)on;
@end

@interface TLSettingSwitchCell : UITableViewCell

@property (nonatomic, assign) id<TLSettingSwitchCellDelegate>delegate;

@property (nonatomic, strong) TLSettingItem *item;

@end
