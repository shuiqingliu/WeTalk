//
//  TLConversationViewController+Delegate.h
//  TLChat
//
//  Created by iOS Team on 16/3/17.
//  Copyright © 2017年 iOS Team. All rights reserved.
//

#import "TLConversationViewController.h"
#import "TLChatViewController.h"
#import "TLAddMenuView.h"

#define     HEIGHT_CONVERSATION_CELL        64.0f

@interface TLConversationViewController (Delegate) <TLMessageManagerConvVCDelegate, UISearchBarDelegate, TLAddMenuViewDelegate>

- (void)registerCellClass;

@end
