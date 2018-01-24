//
//  TLChatCellMenuView.h
//  TLChat
//
//  Created by iOS Team on 16/3/16.
//  Copyright © 2017年 iOS Team. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TLMessageConstants.h"

typedef NS_ENUM(NSInteger, TLChatMenuItemType) {
    TLChatMenuItemTypeCancel,
    TLChatMenuItemTypeCopy,
    TLChatMenuItemTypeDelete,
    TLChatMenuItemTypeVerb,
};

@interface TLChatCellMenuView : UIView

@property (nonatomic, assign, readonly) BOOL isShow;

@property (nonatomic, assign) TLMessageType messageType;

@property (nonatomic, copy) void (^actionBlcok)();

- (void)showInView:(UIView *)view withMessageType:(TLMessageType)messageType rect:(CGRect)rect actionBlock:(void (^)(TLChatMenuItemType))actionBlock;

- (void)dismiss;

@end
