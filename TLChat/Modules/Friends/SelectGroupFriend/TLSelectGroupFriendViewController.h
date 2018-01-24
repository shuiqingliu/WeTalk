//
//  TLSelectGroupFriendViewController.h
//  TLChat
//
//  Created by wky on 17/12/2017.
//  Copyright © 2017 wky. All rights reserved.
//

#import "TLTableViewController.h"
#import "TLFriendSearchViewController.h"
#import "TLFriendHelper.h"
#import "TLDBBaseStore.h"
#import "TLFriendHelper.h"
#import "TLUserHelper.h"
#import "reselectMebViewController.h"

#define     HEIGHT_FRIEND_CELL      54.0f
#define     HEIGHT_HEADER           22.0f


@interface TLSelectGroupFriendViewController : TLTableViewController;

//代理函数,不应该在这里写。
//-(void) addGroupMeb:(NSArray *)reselectedUsers;

@property (nonatomic, weak) NSMutableArray *data;

@property (nonatomic, weak) NSMutableArray *sectionHeaders;

@property (nonatomic, strong) TLFriendSearchViewController *searchVC;


//所选的群成员
@property (nonatomic, strong) NSMutableArray* groupMeb;

//多选框当前编辑状态
@property (nonatomic) UITableViewCellEditingStyle currentEditingStyle;

//选中的IndexPath的数组
@property (nonatomic, strong) NSArray<NSIndexPath*>* paths;

//用户所有群的数组
@property (nonatomic,strong) NSMutableArray* groupsData;

@end
