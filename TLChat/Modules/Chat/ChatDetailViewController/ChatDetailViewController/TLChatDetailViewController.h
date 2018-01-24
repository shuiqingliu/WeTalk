//
//  TLChatDetailViewController.h
//  TLChat
//
//  Created by iOS Team on 16/3/6.
//  Copyright © 2017年 iOS Team. All rights reserved.
//

#import "TLSettingViewController.h"

@class TLUser;
@interface TLChatDetailViewController : TLSettingViewController

@property (nonatomic, strong) TLUser *user;

@end
