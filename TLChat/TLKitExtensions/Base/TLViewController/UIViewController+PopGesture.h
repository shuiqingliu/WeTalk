//
//  UIViewController+PopGesture.h
//  TLChat
//
//  Created by iOS Team on 2017/9/26.
//  Copyright © 2017年 iOS Team. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (PopGesture) <UIGestureRecognizerDelegate>

/// 禁用手势返回（默认为NO）
@property (nonatomic, assign) BOOL disablePopGesture;

@end
