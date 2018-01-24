//
//  TLUserSetting.h
//  TLChat
//
//  Created by iOS Team on 16/3/22.
//  Copyright © 2017年 iOS Team. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TLUserSetting : NSObject

@property (nonatomic, strong) NSString *userID;

@property (nonatomic, assign) BOOL star;

@property (nonatomic, assign) BOOL dismissTimeLine;

@property (nonatomic, assign) BOOL prohibitTimeLine;

@property (nonatomic, assign) BOOL blackList;

@end
