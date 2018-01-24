//
//  TLTalkButton.h
//  TLChat
//
//  Created by iOS Team on 16/7/11.
//  Copyright © 2017年 iOS Team. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TLTalkButton : UIView

@property (nonatomic, strong) NSString *normalTitle;
@property (nonatomic, strong) NSString *cancelTitle;
@property (nonatomic, strong) NSString *highlightTitle;

@property (nonatomic, strong) UIColor *highlightColor;

@property (nonatomic, strong) UILabel *titleLabel;

- (void)setTouchBeginAction:(void (^)())touchBegin
      willTouchCancelAction:(void (^)(BOOL cancel))willTouchCancel
             touchEndAction:(void (^)())touchEnd
          touchCancelAction:(void (^)())touchCancel;

@end
