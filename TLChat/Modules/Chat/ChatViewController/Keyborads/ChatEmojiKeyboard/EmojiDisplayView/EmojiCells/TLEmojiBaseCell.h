//
//  TLEmojiBaseCell.h
//  TLChat
//
//  Created by iOS Team on 16/3/9.
//  Copyright © 2017年 iOS Team. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TLEmoji.h"

@protocol TLEmojiCellProtocol <NSObject>

- (CGRect)displayBaseRect;

@end

@interface TLEmojiBaseCell : UICollectionViewCell <TLEmojiCellProtocol>

@property (nonatomic, strong) TLEmoji *emojiItem;

@property (nonatomic, strong) UIImageView *bgView;

/**
 *  选中时的背景图片，默认nil
 */
@property (nonatomic, strong) UIImage *highlightImage;

@property (nonatomic, assign) BOOL showHighlightImage;

@end
