//
//  TLLoginViewController.h
//  TLChat
//
//  Created by iOS Team on 16/4/3.
//  Copyright © 2017年 iOS Team. All rights reserved.
//

#import "TLViewController.h"

@interface TLLoginViewController : TLViewController

@property (nonatomic, copy) void (^loginSuccess)();

@end
