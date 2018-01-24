//
//  TLTextDisplayView.h
//  TLChat
//
//  Created by iOS Team on 16/3/16.
//  Copyright © 2017年 iOS Team. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TLTextDisplayView : UIView

@property (nonatomic, strong) NSAttributedString *attrString;

- (void)showInView:(UIView *)view withAttrText:(NSAttributedString *)attrText animation:(BOOL)animation;

@end
