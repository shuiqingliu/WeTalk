//
//  TLRecorderIndicatorView.h
//  TLChat
//
//  Created by iOS Team on 16/7/12.
//  Copyright © 2017年 iOS Team. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, TLRecorderStatus) {
    TLRecorderStatusRecording,
    TLRecorderStatusWillCancel,
    TLRecorderStatusTooShort,
};

@interface TLRecorderIndicatorView : UIView

@property (nonatomic, assign) TLRecorderStatus status;

/**
 *  音量大小，取值（0-1）
 */
@property (nonatomic, assign) CGFloat volume;

@end
