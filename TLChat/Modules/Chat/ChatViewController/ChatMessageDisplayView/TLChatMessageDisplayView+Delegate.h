//
//  TLChatMessageDisplayView+Delegate.h
//  TLChat
//
//  Created by iOS Team on 16/3/17.
//  Copyright © 2017年 iOS Team. All rights reserved.
//

#import "TLChatMessageDisplayView.h"
#import "TLTextMessageCell.h"
#import "TLImageMessageCell.h"
#import "TLExpressionMessageCell.h"
#import "TLVoiceMessageCell.h"
#import "TLFileMessageCell.h"

@interface TLChatMessageDisplayView (Delegate) <UITableViewDelegate, UITableViewDataSource, TLMessageCellDelegate, TLActionSheetDelegate>

- (void)registerCellClassForTableView:(UITableView *)tableView;


-(void)showAlertMsg:(NSString *)message Duration:(float)duration;

@end
