//
//  TLVoiceImageView.h
//  TLChat
//
//  Created by iOS Team on 16/7/11.
//  Copyright © 2017年 iOS Team. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TLVoiceImageView : UIImageView

@property (nonatomic, assign) BOOL isFromMe;

- (void)startPlayingAnimation;

- (void)stopPlayingAnimation;

@end
