//
//  TLTableViewCell.h
//  TLChat
//
//  Created by iOS Team on 16/1/23.
//  Copyright © 2017年 iOS Team. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, TLCellLineStyle) {
    TLCellLineStyleNone,
    TLCellLineStyleDefault,
    TLCellLineStyleFill,
};

@interface TLTableViewCell : UITableViewCell

/**
 *  左边距
 */
@property (nonatomic, assign) CGFloat leftSeparatorSpace;

/**
 *  右边距，默认0，要修改只能直接指定
 */
@property (nonatomic, assign) CGFloat rightSeparatorSpace;

@property (nonatomic, assign) TLCellLineStyle topLineStyle;
@property (nonatomic, assign) TLCellLineStyle bottomLineStyle;

@end
