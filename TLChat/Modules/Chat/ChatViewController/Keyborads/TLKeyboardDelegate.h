//
//  TLKeyboardDelegate.h
//  TLChat
//
//  Created by iOS Team on 16/2/17.
//  Copyright © 2017年 iOS Team. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol TLKeyboardDelegate <NSObject>

@optional
@optional
- (void)chatKeyboardWillShow:(id)keyboard animated:(BOOL)animated;

- (void)chatKeyboardDidShow:(id)keyboard animated:(BOOL)animated;

- (void)chatKeyboardWillDismiss:(id)keyboard animated:(BOOL)animated;

- (void)chatKeyboardDidDismiss:(id)keyboard animated:(BOOL)animated;

- (void)chatKeyboard:(id)keyboard didChangeHeight:(CGFloat)height;

@end
