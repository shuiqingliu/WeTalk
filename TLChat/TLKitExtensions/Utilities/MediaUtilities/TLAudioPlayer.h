//
//  TLAudioPlayer.h
//  TLChat
//
//  Created by iOS Team on 16/7/12.
//  Copyright © 2017年 iOS Team. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TLAudioPlayer : NSObject

@property (nonatomic, assign, readonly) BOOL isPlaying;

+ (TLAudioPlayer *)sharedAudioPlayer;

- (void)playAudioAtPath:(NSString *)path complete:(void (^)(BOOL finished))complete;

- (void)stopPlayingAudio;

@end
