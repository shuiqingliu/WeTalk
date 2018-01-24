//
//  TLScannerView.h
//  TLChat
//
//  Created by iOS Team on 16/3/4.
//  Copyright © 2017年 iOS Team. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TLScannerView : UIView

/**
 *  隐藏扫描指示器，默认NO
 */
@property (nonatomic, assign) BOOL hiddenScannerIndicator;

- (void)startScanner;

- (void)stopScanner;

@end
