//
//  TLVoiceMessage.h
//  TLChat
//
//  Created by iOS Team on 16/7/11.
//  Copyright © 2017年 iOS Team. All rights reserved.
//

#import "TLMessage.h"

typedef NS_ENUM(NSInteger, TLVoiceMessageStatus) {
    TLVoiceMessageStatusNormal,
    TLVoiceMessageStatusRecording,
    TLVoiceMessageStatusPlaying,
};

@interface TLVoiceMessage : TLMessage

@property (nonatomic, strong) NSString *recFileName;

@property (nonatomic, strong, readonly) NSString *path;
@property (nonatomic, strong) NSString *url;
@property (nonatomic, assign) CGFloat time;

@property (nonatomic, assign) TLVoiceMessageStatus msgStatus;

@end
