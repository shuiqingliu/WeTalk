//
//  TLChatBackgroundSettingViewController.h
//  TLChat
//
//  Created by iOS Team on 16/3/19.
//  Copyright © 2017年 iOS Team. All rights reserved.
//

#import "TLSettingViewController.h"

@interface TLChatBackgroundSettingViewController : TLSettingViewController

/**
 *  若为nil则全局设置，否则只给对应好友设置
 */
@property (nonatomic, assign) NSString *partnerID;

@end
