//
//  TLMomentDetailBaseView.h
//  TLChat
//
//  Created by iOS Team on 16/5/2.
//  Copyright © 2017年 iOS Team. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TLMomentDetail.h"
#import "TLMomentViewDelegate.h"

@interface TLMomentDetailBaseView : UIView

@property (nonatomic, assign) id<TLMomentDetailViewDelegate> delegate;

@property (nonatomic, strong) TLMomentDetail *detail;

@end
