//
//  TLMoreKeyboardDelegate.h
//  TLChat
//
//  Created by iOS Team on 16/2/20.
//  Copyright © 2017年 iOS Team. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TLMoreKeyboardItem.h"

@protocol TLMoreKeyboardDelegate <NSObject>
@optional
- (void)moreKeyboard:(id)keyboard didSelectedFunctionItem:(TLMoreKeyboardItem *)funcItem;

@end
