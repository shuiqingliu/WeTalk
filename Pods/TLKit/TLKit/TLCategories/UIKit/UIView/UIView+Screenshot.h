//
//  UIView+Screenshot.h
//  TLKit
//
//  Created by iOS Team on 2017/8/27.
//  Copyright © 2017年 libokun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Screenshot)

/**
 *  截屏
 *
 *  线程安全的
 */
- (UIImage *)captureImage;

@end
