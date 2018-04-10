//
//  TLConversationViewController.h
//  TLChat
//
//  Created by iOS Team on 16/1/23.
//  Copyright © 2017年 iOS Team. All rights reserved.
//

#import "TLTableViewController.h"
#import "TLMessageManager+ConversationRecord.h"
#import "TLFriendSearchViewController.h"

@interface TLConversationViewController : TLTableViewController<searchCancelDelegate>
-(void) cancelSearch:(TLUser*) user;

@property (nonatomic, strong) TLFriendSearchViewController *searchVC;

@property (nonatomic, strong) NSMutableArray *data;

//实现receiveDelegate代理协议
-(void) receiveMessage:(TLMessage *)message;

@end
