//
//  TLFriendSearchViewController.h
//  TLChat
//
//  Created by iOS Team on 16/1/25.
//  Copyright © 2017年 iOS Team. All rights reserved.
//

#import "TLTableViewController.h"
#import "TLTableViewController.h"
#import "TLFriendSearchViewController.h"
#import "TLFriendHelper.h"
#import "TLDBBaseStore.h"
#import "TLFriendHelper.h"
#import "TLUserHelper.h"
#define     HEIGHT_FRIEND_CELL      55.0f

//定义代理，在TLConversationViewController当中实现代理。
//该代理负责"点击"取消按钮。
@protocol searchCancelDelegate <NSObject>

-(void) cancelSearch:(TLUser *)user;

@end


@interface TLFriendSearchViewController : TLTableViewController <UISearchResultsUpdating>

@property (nonatomic, strong) NSMutableArray *friendsData;

//定义一个代理对象
@property(assign,nonatomic) id<searchCancelDelegate> delegate;


@end
