//
//  NSTimer+Block.h
//  TLKit
//
//  Created by iOS Team on 2017/9/11.
//  Copyright © 2017年 iOS Team. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSTimer (Block)

+ (id)scheduledTimerWithTimeInterval:(NSTimeInterval)inTimeInterval block:(void (^)(NSTimer *timer))inBlock repeats:(BOOL)repeats;

+ (id)timerWithTimeInterval:(NSTimeInterval)inTimeInterval block:(void (^)(NSTimer *timer))inBlock repeats:(BOOL)repeats;

@end
