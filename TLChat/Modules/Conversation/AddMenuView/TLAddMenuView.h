//
//  TLAddMenuView.h
//  TLChat
//
//  Created by iOS Team on 16/3/11.
//  Copyright © 2017年 iOS Team. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TLAddMenuItem.h"

@class TLAddMenuView;
@protocol TLAddMenuViewDelegate <NSObject>

- (void)addMenuView:(TLAddMenuView *)addMenuView didSelectedItem:(TLAddMenuItem *)item;

@end

@interface TLAddMenuView : UIView

@property (nonatomic, assign) id<TLAddMenuViewDelegate>delegate;

/**
 *  显示AddMenu
 *
 *  @param view 父View
 */
- (void)showInView:(UIView *)view;

/**
 *  是否正在显示
 */
- (BOOL)isShow;

/**
 *  隐藏
 */
- (void)dismiss;

@end
