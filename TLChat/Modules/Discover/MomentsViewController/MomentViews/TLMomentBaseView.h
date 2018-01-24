//
//  TLMomentBaseView.h
//  TLChat
//
//  Created by iOS Team on 16/4/23.
//  Copyright © 2017年 iOS Team. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TLMomentViewDelegate.h"
#import "TLMoment.h"

@interface TLMomentBaseView : UIView

@property (nonatomic, assign) id<TLMomentViewDelegate> delegate;

@property (nonatomic, strong) UILabel *titleLabel;

@property (nonatomic, strong) UIView *detailContainerView;

@property (nonatomic, strong) UIView *extensionContainerView;

@property (nonatomic, strong) TLMoment *moment;

@end
