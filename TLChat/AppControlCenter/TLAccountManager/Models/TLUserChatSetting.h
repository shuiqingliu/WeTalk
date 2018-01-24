//
//  TLUserChatSetting.h
//  TLChat
//
//  Created by iOS Team on 16/3/22.
//  Copyright © 2017年 iOS Team. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TLUserChatSetting : NSObject

@property (nonatomic, strong) NSString *userID;

@property (nonatomic, assign) BOOL top;

@property (nonatomic, assign) BOOL noDisturb;

@property (nonatomic, strong) NSString *chatBGPath;

@end
