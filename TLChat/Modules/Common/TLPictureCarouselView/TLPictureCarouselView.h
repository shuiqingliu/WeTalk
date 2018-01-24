//
//  TLPictureCarouselView.h
//  TLChat
//
//  Created by iOS Team on 16/4/20.
//  Copyright © 2017年 iOS Team. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TLPictureCarouselProtocol.h"

#define         DEFAULT_TIMEINTERVAL        5.0f

@class TLPictureCarouselView;
@protocol TLPictureCarouselDelegate <NSObject>

- (void)pictureCarouselView:(TLPictureCarouselView *)pictureCarouselView
              didSelectItem:(id<TLPictureCarouselProtocol>)model;

@end

@interface TLPictureCarouselView : UIView

@property (nonatomic, strong) NSArray *data;

@property (nonatomic, assign) id<TLPictureCarouselDelegate> delegate;

@property (nonatomic, assign) NSTimeInterval timeInterval;

@end
