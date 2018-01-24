//
//  TLMomentMultiImageView.h
//  TLChat
//
//  Created by iOS Team on 16/4/21.
//  Copyright © 2017年 iOS Team. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TLMomentViewDelegate.h"

@interface TLMomentMultiImageView : UIView

@property (nonatomic, assign) id<TLMomentMultiImageViewDelegate> delegate;

@property (nonatomic, strong) NSArray *images;

@end
