//
//  TLMyExpressionCell.h
//  TLChat
//
//  Created by iOS Team on 16/3/12.
//  Copyright © 2017年 iOS Team. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TLEmojiGroup.h"

@protocol TLMyExpressionCellDelegate <NSObject>

- (void)myExpressionCellDeleteButtonDown:(TLEmojiGroup *)group;

@end

@interface TLMyExpressionCell : UITableViewCell

@property (nonatomic, assign) id<TLMyExpressionCellDelegate>delegate;

@property (nonatomic, strong) TLEmojiGroup *group;

@end
