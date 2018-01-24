//
//  TLExpressionBannerCell.h
//  TLChat
//
//  Created by iOS Team on 16/4/20.
//  Copyright © 2017年 iOS Team. All rights reserved.
//

#import "TLTableViewCell.h"

@protocol TLExpressionBannerCellDelegate <NSObject>

- (void)expressionBannerCellDidSelectBanner:(id)item;

@end

@interface TLExpressionBannerCell : TLTableViewCell

@property (nonatomic, assign) id<TLExpressionBannerCellDelegate>delegate;

@property (nonatomic, strong) NSArray *data;

@end
