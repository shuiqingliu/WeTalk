//
//  reselectMebViewController.h
//  TLChat
//
//  Created by wky on 07/01/2018.
//  Copyright © 2018 . All rights reserved.
//

#import "TLTableViewController.h"
#import "TLFriendSearchViewController.h"
#import "TLFriendHelper.h"
#import "TLDBBaseStore.h"
#import "TLFriendHelper.h"
#import "TLUserHelper.h"

#define     HEIGHT_FRIEND_CELL      54.0f
#define     HEIGHT_HEADER           22.0f


//定义代理，在TLSelectGroupFriendViewController当中实现代理。
//该代理负责更新GroupMeb数组。
@protocol reselectMebDelegate <NSObject>

-(void) addGroupMeb:(NSArray *)reselectedUsers;

@end

@interface reselectMebViewController : TLTableViewController

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

//定义一个代理对象
@property(assign,nonatomic) id<reselectMebDelegate> delegate;

@end
