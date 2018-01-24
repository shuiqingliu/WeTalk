//
//  TLChatCellMenuView.m
//  TLChat
//
//  Created by iOS Team on 16/3/16.
//  Copyright © 2017年 iOS Team. All rights reserved.
//

#import "TLChatCellMenuView.h"

@interface TLChatCellMenuView ()

@property (nonatomic, strong) UIMenuController *menuController;

@end

@implementation TLChatCellMenuView

- (id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setBackgroundColor:[UIColor clearColor]];
        self.menuController = [UIMenuController sharedMenuController];
        
        UITapGestureRecognizer *tapGR = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismiss)];
        [self addGestureRecognizer:tapGR];
    }
    return self;
}

- (void)showInView:(UIView *)view withMessageType:(TLMessageType)messageType rect:(CGRect)rect actionBlock:(void (^)(TLChatMenuItemType))actionBlock
{
    _isShow = YES;
    [self setFrame:view.bounds];
    [view addSubview:self];
    [self setActionBlcok:actionBlock];
    [self setMessageType:messageType];
    
    [self.menuController setTargetRect:rect inView:self];
    [self becomeFirstResponder];
    [self.menuController setMenuVisible:YES animated:YES];
}

- (void)setMessageType:(TLMessageType)messageType
{
    UIMenuItem *copy = [[UIMenuItem alloc] initWithTitle:@"复制" action:@selector(copyButtonDown:)];
//    UIMenuItem *transmit = [[UIMenuItem alloc] initWithTitle:@"转发" action:@selector(transmitButtonDown:)];
    UIMenuItem *recall = [[UIMenuItem alloc] initWithTitle:@"撤回" action:@selector(recallButtonDown:)];
    UIMenuItem *del = [[UIMenuItem alloc] initWithTitle:@"删除" action:@selector(deleteButtonDown:)];
    [self.menuController setMenuItems:@[copy,recall, del]];

}

- (void)dismiss
{
    _isShow = NO;
    if (self.actionBlcok) {
        self.actionBlcok(TLChatMenuItemTypeCancel);
    }
    [self.menuController setMenuVisible:NO animated:YES];
    [self removeFromSuperview];
}

- (BOOL)canBecomeFirstResponder
{
    return YES;
}

#pragma mark - Event Response -
- (void)copyButtonDown:(UIMenuController *)sender
{
    [self p_clickedMenuItemType:TLChatMenuItemTypeCopy];
    
}
//
//- (void)transmitButtonDown:(UIMenuController *)sender
//{
//    [self p_clickedMenuItemType:TLChatMenuItemTypeCopy];
//}

- (void)recallButtonDown:(UIMenuController *)sender
{
    //[self p_clickedMenuItemType:TLChatMenuItemTypeCopy];
//    UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"撤回" message:@"是否撤回？" delegate:self cancelButtonTitle:@"YES"otherButtonTitles:@"NO",nil];
//    [alert show];
    [self p_clickedMenuItemType:TLChatMenuItemTypeVerb];
    
}

- (void)deleteButtonDown:(UIMenuController *)sender
{
    [self p_clickedMenuItemType:TLChatMenuItemTypeDelete];
}

#pragma mark - Private Methods -
- (void)p_clickedMenuItemType:(TLChatMenuItemType)type
{
    _isShow = NO;
    [self removeFromSuperview];
    if (self.actionBlcok) {
        self.actionBlcok(type);
    }
}

@end
