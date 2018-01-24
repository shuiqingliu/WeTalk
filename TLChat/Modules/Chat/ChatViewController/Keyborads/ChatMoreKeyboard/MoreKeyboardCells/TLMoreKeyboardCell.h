//
//  TLMoreKeyboardCell.h
//  TLChat
//
//  Created by iOS Team on 16/2/18.
//  Copyright © 2017年 iOS Team. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TLMoreKeyboardItem.h"

@interface TLMoreKeyboardCell : UICollectionViewCell

@property (nonatomic, strong) TLMoreKeyboardItem *item;

@property (nonatomic, strong) void(^clickBlock)(TLMoreKeyboardItem *item);

@end
