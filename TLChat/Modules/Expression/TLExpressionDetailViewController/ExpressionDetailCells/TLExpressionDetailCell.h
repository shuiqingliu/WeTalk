//
//  TLExpressionDetailCell.h
//  TLChat
//
//  Created by iOS Team on 16/4/11.
//  Copyright © 2017年 iOS Team. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TLEmojiGroup.h"

#define         HEIGHT_EXP_BANNER       (SCREEN_WIDTH * 0.45)

@protocol TLExpressionDetailCellDelegate <NSObject>

- (void)expressionDetailCellDownloadButtonDown:(TLEmojiGroup *)group;

@end

@interface TLExpressionDetailCell : UICollectionViewCell

@property (nonatomic, assign) id <TLExpressionDetailCellDelegate> delegate;

@property (nonatomic, strong) TLEmojiGroup *group;

+ (CGFloat)cellHeightForModel:(TLEmojiGroup *)group;

@end
