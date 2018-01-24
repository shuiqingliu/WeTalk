//
//  TLScannerViewController.h
//  TLChat
//
//  Created by iOS Team on 16/2/24.
//  Copyright © 2017年 iOS Team. All rights reserved.
//

#import <UIKit/UIkit.h>
#import "TLScannerButton.h"

@class TLScannerViewController;
@protocol TLScannerDelegate <NSObject>
@optional
- (void)scannerViewControllerInitSuccess:(TLScannerViewController *)scannerVC;

- (void)scannerViewController:(TLScannerViewController *)scannerVC
                   initFailed:(NSString *)errorString;


- (void)scannerViewController:(TLScannerViewController *)scannerVC
                   scanAnswer:(NSString *)ansStr;

@end

@interface TLScannerViewController : UIViewController

@property (nonatomic, assign) TLScannerType scannerType;

@property (nonatomic, assign) id<TLScannerDelegate>delegate;

@property (nonatomic, assign, readonly) BOOL isRunning;

- (void)startCodeReading;

- (void)stopCodeReading;

+ (void)scannerQRCodeFromImage:(UIImage *)image ans:(void (^)(NSString *ansStr))ans;

@end
