//
//  TLChatMessageDisplayView+Delegate.m
//  TLChat
//
//  Created by iOS Team on 16/3/17.
//  Copyright © 2017年 iOS Team. All rights reserved.
//

#import "TLChatMessageDisplayView+Delegate.h"
#import "TLTextDisplayView.h"
#import "TLChatEventStatistics.h"

@implementation TLChatMessageDisplayView (Delegate)

#pragma mark - # Public Methods
- (void)registerCellClassForTableView:(UITableView *)tableView
{
    [tableView registerClass:[TLTextMessageCell class] forCellReuseIdentifier:@"TLTextMessageCell"];
    [tableView registerClass:[TLImageMessageCell class] forCellReuseIdentifier:@"TLImageMessageCell"];
    [tableView registerClass:[TLExpressionMessageCell class] forCellReuseIdentifier:@"TLExpressionMessageCell"];
    [tableView registerClass:[TLVoiceMessageCell class] forCellReuseIdentifier:@"TLVoiceMessageCell"];
    [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"EmptyCell"];
    [tableView registerClass:[TLFileMessageCell class] forCellReuseIdentifier:@"TLFileMessageCell"];
}

#pragma mark - # Delegate
//MARK: UITableViewDataSouce
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.data.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TLMessage * message = self.data[indexPath.row];
    if (message.messageType == TLMessageTypeText) {
        TLTextMessageCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TLTextMessageCell"];
        [cell setMessage:message];
        [cell setDelegate:self];
        return cell;
    }
    else if (message.messageType == TLMessageTypeImage) {
        TLImageMessageCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TLImageMessageCell"];
        [cell setMessage:message];
        [cell setDelegate:self];
        return cell;
    }
    else if (message.messageType == TLMessageTypeExpression) {
        TLExpressionMessageCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TLExpressionMessageCell"];
        [cell setMessage:message];
        [cell setDelegate:self];
        return cell;
    }
    else if (message.messageType == TLMessageTypeVoice) {
        TLVoiceMessageCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TLVoiceMessageCell"];
        [cell setMessage:message];
        [cell setDelegate:self];
        return cell;
    }
    else if (message.messageType == TLMessageTypeFile) {
        TLVoiceMessageCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TLFileMessageCell"];
        [cell setMessage:message];
        [cell setDelegate:self];
        return cell;
    }
    
    return [tableView dequeueReusableCellWithIdentifier:@"EmptyCell"];
}

//MARK: UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    if (indexPath.row >= self.data.count) {
        return 0.0f;
    }
    TLMessage * message = self.data[indexPath.row];
    return message.messageFrame.height;
}

//MARK: TLMessageCellDelegate
- (void)messageCellDidClickAvatarForUser:(TLUser *)user
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(chatMessageDisplayView:didClickUserAvatar:)]) {
        [self.delegate chatMessageDisplayView:self didClickUserAvatar:user];
    }
}

- (void)messageCellTap:(TLMessage *)message
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(chatMessageDisplayView:didClickMessage:)]) {
        [self.delegate chatMessageDisplayView:self didClickMessage:message];
    }
}

/**
 *  双击Message Cell
 */
- (void)messageCellDoubleClick:(TLMessage *)message
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(chatMessageDisplayView:didDoubleClickMessage:)]) {
        [self.delegate chatMessageDisplayView:self didDoubleClickMessage:message];
    }
}

- (void)messageCellLongPress:(TLMessage *)message rect:(CGRect)rect
{
    NSInteger row = [self.data indexOfObject:message];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:row inSection:0];
    if (self.disableLongPressMenu) {
        [self.tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
        return;
    }

    CGRect cellRect = [self.tableView rectForRowAtIndexPath:indexPath];
    rect.origin.y += cellRect.origin.y - self.tableView.contentOffset.y;
    __weak typeof(self)weakSelf = self;
    [self.menuView showInView:self withMessageType:message.messageType rect:rect actionBlock:^(TLChatMenuItemType type) {
        [weakSelf.tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
        if (type == TLChatMenuItemTypeCopy) {
            NSString *str = [message messageCopy];
            [[UIPasteboard generalPasteboard] setString:str];
        }
        else if (type == TLChatMenuItemTypeDelete) {
            TLActionSheet *actionSheet = [[TLActionSheet alloc] initWithTitle:@"是否删除该条消息" delegate:weakSelf cancelButtonTitle:@"取消" destructiveButtonTitle:@"确定" otherButtonTitles: nil];
            actionSheet.tag = [weakSelf.data indexOfObject:message];
            [actionSheet show];
        }else if (type == TLChatMenuItemTypeVerb) {
            
            // 发送这条消息在服务器的时间
            NSTimeInterval time1 =  [[message date] timeIntervalSince1970];
            // 当前的时间戳
            NSTimeInterval nowTime = [[NSDate date] timeIntervalSince1970];
            NSTimeInterval cha = nowTime - time1;
            NSInteger timecha = cha;
            if (timecha <= 120) {
                // 开始调用发送消息回撤的方法
                [self p_deleteMessage:message];
                [self showAlertMsg:@"你撤回了一条消息" Duration:5];
                
            }
            else {
                [self showAlertMsg:@"消息已经超过两分钟 无法撤回" Duration:5];
            }
            
        }
    }];
}

//MARK: UIScrollViewDelegate
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(chatMessageDisplayViewDidTouched:)]) {
        [self.delegate chatMessageDisplayViewDidTouched:self];
    }
}

//MARK: TLActionSheetDelegate
- (void)actionSheet:(TLActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 0) {
        TLMessage * message = [self.data objectAtIndex:actionSheet.tag];
        [self p_deleteMessage:message];
        [self showAlertMsg:@"你删除了一条消息" Duration:5];
    }
}

#pragma mark - # Private Methods
- (void)p_deleteMessage:(TLMessage *)message
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(chatMessageDisplayView:deleteMessage:)]) {
        BOOL ok = [self.delegate chatMessageDisplayView:self deleteMessage:message];
        if (ok) {
            [self deleteMessage:message withAnimation:YES];
            [MobClick event:EVENT_DELETE_MESSAGE];
        }
        else {
            [TLUIUtility showAlertWithTitle:@"错误" message:@"从数据库中删除消息失败。"];
        }
    }
}


-(void)showAlertMsg:(NSString *)message Duration:(float)duration
{
    UIWindow * window = [UIApplication sharedApplication].keyWindow;
    UIView *showview =  [[UIView alloc]init];
    showview.backgroundColor = [UIColor blackColor];
    showview.frame = CGRectMake(1, 1, 1, 1);
    
    showview.alpha = 1.0f;
    showview.layer.cornerRadius = 5.0f;
    showview.layer.masksToBounds = YES;
    [window addSubview:showview];
    
    UILabel *label = [[UILabel alloc]init];
    
    CGSize LabelSize = [message sizeWithFont:[UIFont systemFontOfSize:17] constrainedToSize:CGSizeMake(SCREEN_WIDTH-50, 9000)];
    label.frame = CGRectMake(10, 5, LabelSize.width, LabelSize.height);
    label.text = message;
    label.textColor = [UIColor whiteColor];
    label.textAlignment = 1;
    label.backgroundColor = [UIColor clearColor];
    label.font = [UIFont boldSystemFontOfSize:15];
    label.numberOfLines = 0; //
    
    [showview addSubview:label];
    showview.frame = CGRectMake((SCREEN_WIDTH - LabelSize.width)/2, SCREEN_HEIGHT-100-LabelSize.height, LabelSize.width+10, LabelSize.height+10);
    [UIView animateWithDuration:duration animations:^{
        showview.alpha = 0;
    } completion:^(BOOL finished) {
        [showview removeFromSuperview];
    }];
}


@end
