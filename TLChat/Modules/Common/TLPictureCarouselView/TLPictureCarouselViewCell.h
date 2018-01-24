//
//  TLPictureCarouselViewCell.h
//  TLChat
//
//  Created by iOS Team on 16/4/20.
//  Copyright © 2017年 iOS Team. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TLPictureCarouselProtocol.h"

@interface TLPictureCarouselViewCell : UICollectionViewCell

@property (nonatomic, strong) id<TLPictureCarouselProtocol> model;

@end
