//
//  TLAudioRecorder.h
//  TLChat
//
//  Created by iOS Team on 16/7/11.
//  Copyright © 2017年 iOS Team. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TLAudioRecorder : NSObject

+ (TLAudioRecorder *)sharedRecorder;

- (void)startRecordingWithVolumeChangedBlock:(void (^)(CGFloat volume))volumeChanged
                               completeBlock:(void (^)(NSString *path, CGFloat time))complete
                                 cancelBlock:(void (^)())cancel;
- (void)stopRecording;
- (void)cancelRecording;

@end
