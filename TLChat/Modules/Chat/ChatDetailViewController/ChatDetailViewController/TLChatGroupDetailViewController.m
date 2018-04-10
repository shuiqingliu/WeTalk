//
//  TLChatGroupDetailViewController.m
//  TLChat
//
//  Created by iOS Team on 16/3/8.
//  Copyright © 2017年 iOS Team. All rights reserved.
//
#import "reselectMebViewController.h"
#import "TLSelectGroupFriendViewController.h"
#import "TLChatGroupDetailViewController.h"
#import "TLChatDetailHelper.h"
#import "TLMessageManager+MessageRecord.h"
#import "TLUserGroupCell.h"

#import "TLChatViewController.h"

#import "TLFriendDetailViewController.h"
#import "TLGroupQRCodeViewController.h"
#import "TLChatFileViewController.h"
#import "TLChatBackgroundSettingViewController.h"

#import "TLChatNotificationKey.h"

#import "TLGroupNameViewController.h"

#import "TLLaunchManager.h"
#import "MessageKit.h"
#import "MessageTrans.h"

#define     TAG_EMPTY_CHAT_REC      1001

@interface TLChatGroupDetailViewController () <TLUserGroupCellDelegate, TLActionSheetDelegate>

@property (nonatomic, strong) TLChatDetailHelper *helper;

@end

@implementation TLChatGroupDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationItem setTitle:@"聊天详情"];
    
    self.groupStore = [[TLDBGroupStore alloc]init];
    
    self.helper = [[TLChatDetailHelper alloc] init];
    self.data = [self.helper chatDetailDataByGroupInfo:self.group];
    
    [self.tableView registerClass:[TLUserGroupCell class] forCellReuseIdentifier:@"TLUserGroupCell"];
}


#pragma mark - Delegate -
//MARK: UITableViewDataSource
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0 && indexPath.row == 0) {
        TLUserGroupCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TLUserGroupCell"];
        [cell setUsers:self.group.users];
        [cell setDelegate:self];
        return cell;
    }
    return [super tableView:tableView cellForRowAtIndexPath:indexPath];
}

//MARK: UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    TLSettingItem *item = [self.data[indexPath.section] objectAtIndex:indexPath.row];
    if ([item.title isEqualToString:@"群二维码"]) {
        TLGroupQRCodeViewController *gorupQRCodeVC = [[TLGroupQRCodeViewController alloc] init];
        [gorupQRCodeVC setGroup:self.group];
        [self setHidesBottomBarWhenPushed:YES];
        [self.navigationController pushViewController:gorupQRCodeVC animated:YES];
    }
    else if ([item.title isEqualToString:@"设置当前聊天背景"]) {
        TLChatBackgroundSettingViewController *chatBGSettingVC = [[TLChatBackgroundSettingViewController alloc] init];
        [chatBGSettingVC setPartnerID:self.group.groupID];
        [self setHidesBottomBarWhenPushed:YES];
        [self.navigationController pushViewController:chatBGSettingVC animated:YES];
    }
    else if ([item.title isEqualToString:@"聊天文件"]) {
        TLChatFileViewController *chatFileVC = [[TLChatFileViewController alloc] init];
        [chatFileVC setPartnerID:self.group.groupID];
        [self setHidesBottomBarWhenPushed:YES];
        [self.navigationController pushViewController:chatFileVC animated:YES];
    }
    else if ([item.title isEqualToString:@"清空聊天记录"]) {
        TLActionSheet *actionSheet = [[TLActionSheet alloc] initWithTitle:nil delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:@"清空聊天记录" otherButtonTitles: nil];
        actionSheet.tag = TAG_EMPTY_CHAT_REC;
        [actionSheet show];
    }
    else if([item.title isEqualToString:@"群聊名称"]) {
        NSLog(@"点击修改群名称操作！！！");
        TLGroupNameViewController *groupNameVC = [[TLGroupNameViewController alloc] init];
        [self setHidesBottomBarWhenPushed:NO];
        [self.navigationController pushViewController:groupNameVC animated:YES];
        
    }
    [self.tableView deselectRowAtIndexPath:indexPath animated:NO];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0 && indexPath.row == 0) {
        NSUInteger count = self.group.count;
        return ((count + 1) / 4 + ((((count + 1) % 4) == 0) ? 0 : 1)) * 90 + 15;
    }
    return [super tableView:tableView heightForRowAtIndexPath:indexPath];
}

//MARK: TLActionSheetDelegate
- (void)actionSheet:(TLActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (actionSheet.tag == TAG_EMPTY_CHAT_REC) {
        if (buttonIndex == 0) {
            BOOL ok = [[TLMessageManager sharedInstance] deleteMessagesByPartnerID:self.group.groupID];
            if (!ok) {
                [TLUIUtility showAlertWithTitle:@"错误" message:@"清空讨论组聊天记录失败"];
            }
            else {
                [[NSNotificationCenter defaultCenter] postNotificationName:NOTI_CHAT_VIEW_RESET object:nil];
            }
        }
    }
}

//MARK: TLUserGroupCellDelegate
- (void)userGroupCellDidSelectUser:(TLUser *)user
{
    TLFriendDetailViewController *detailVC = [[TLFriendDetailViewController alloc] init];
    [detailVC setUser:user];
    [self setHidesBottomBarWhenPushed:YES];
    [self.navigationController pushViewController:detailVC animated:YES];
}

- (void)userGroupCellAddUserButtonDown
{
    //[TLUIUtility showAlertWithTitle:@"提示" message:@"添加讨论组成员"];
//    TLSelectGroupFriendViewController *reSelectGroupFriendViewController
//    = [[TLSelectGroupFriendViewController alloc]init];
//    [self.navigationController pushViewController:reSelectGroupFriendViewController animated:YES];
    
    reselectMebViewController* reselectVC =  [[reselectMebViewController alloc]init];
    
    //将选择其他成员的代理设置为当前页面。
    reselectVC.delegate = self;
    
    [self.navigationController pushViewController:reselectVC animated:YES];
}

-(void)addGroupMeb:(NSArray *)reselectedUsers{
    NSLog(@"d*****************RRRR");
    NSLog(@"%@",[TLUserHelper sharedHelper].userID);
    NSLog(@"%@",self.group.groupID);

    for(TLUser* user in reselectedUsers){
        NSLog(@"%@",user.remarkName);
        BOOL ok = [self.groupStore addGroupMember:user forUid:[TLUserHelper sharedHelper].userID andGid:self.group.groupID];
        if (!ok) {
            DDLogError(@"插入群成员到数据库失败!");
        }
    }
    
    NSArray* groupsData = [[NSArray alloc]init];
    groupsData = [self.groupStore groupsDataByUid:[TLUserHelper sharedHelper].userID];
    TLGroup * temp = [[TLGroup alloc]init];
    for(TLGroup* group in groupsData){
        NSLog(@"######**********&&*&*&*&*&*&*&*######$");
        NSLog(@"%@",group.groupID);
        NSLog(@"%@",group.groupName);
        if(group.groupID==self.group.groupID){
            temp = group;
        }
        
        for(TLUser* user in group.users){
            NSLog(@"%@",user.showName);
        }
        NSLog(@"#######&*&*&*&*&*&*#####");
    }
    
    
    //给服务端发送到接口：向群里拉人
    //格式{'uid'：'xxx'，'gname'，'xxx'， 'mem'：['xxx'， 'xxx'， ...]}
    
    NSMutableString* userIDs = [[NSMutableString alloc]init];
    [userIDs appendString:@"["];
    for(TLUser *user in reselectedUsers){
        [userIDs appendString:user.userID];
        [userIDs appendString:@","];
        
    }
    [userIDs deleteCharactersInRange:NSMakeRange(userIDs.length-1, 1)];
    [userIDs appendString:@"]"];
    //   {'uid'：'xxx'，'gname'，'xxx'， 'mem'：['xxx'， 'xxx'， ...]}
    NSString* text =[ [NSString alloc]initWithFormat:@"{uid:%@,gid:%@,mem:%@}",[TLUserHelper sharedHelper].userID,_group.groupID,userIDs];
    MessageKit *createGroupMessage = [[MessageKit alloc]initWithParament:@"createGroup" from:[TLUserHelper sharedHelper].userID to:@"createGroup_server" content:text];
    NSString *createGroupMsg = [createGroupMessage getJsonData];
    [[MessageTrans sharedInstance] sendMessageWithString:createGroupMsg];

    
    //新建Chat
    TLChatViewController *chatVC = [[TLChatViewController alloc] init];
    //[self setHidesBottomBarWhenPushed:YES];
    [chatVC setPartner:temp];
    //[self.navigationController popViewControllerAnimated:NO];
    [self.navigationController popToRootViewControllerAnimated:NO];
    NSLog(@"55555555");
    UIViewController *vc = [[TLLaunchManager sharedInstance].rootVC childViewControllerAtIndex:0];
    [[TLLaunchManager sharedInstance].rootVC setSelectedIndex:0];
    [vc setHidesBottomBarWhenPushed:YES];
    [vc.navigationController pushViewController:chatVC animated:NO];
    [vc setHidesBottomBarWhenPushed:NO];
    
    //[self.navigationController popViewControllerAnimated:NO];
    
   
    
}


@end
