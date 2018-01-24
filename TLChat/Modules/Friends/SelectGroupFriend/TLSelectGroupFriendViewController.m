//
//  TLSelectGroupFriendViewController.m
//  TLChat
//
//  Created by wky on 17/12/2017.
//  Copyright © 2017 wky. All rights reserved.
//

#import "TLSelectGroupFriendViewController.h"
#import "TLFriendCell.h"
#import "TLSearchController.h"
#import "TLFriendHelper.h"

#import "TLAddFriendViewController.h"

#import "TLFriendsViewController+Delegate.h"
#import "TLFriendHeaderView.h"
#import "TLFriendCell.h"

#import "TLNewFriendViewController.h"
#import "TLGroupViewController.h"
#import "TLTagsViewController.h"
#import "TLPublicServerViewController.h"
#import "TLFriendDetailViewController.h"

#import "TLUserGroup.h"
#import "TLFriendHelper.h"

#import "TLConversation+TLUser.h"
#import "TLConversationCell.h"
#import "TLChatViewController.h"
#import "TLGroup+CreateAvatar.h"
#import "TLDBGroupStore.h"
#import "TLLaunchManager.h"


@interface TLSelectGroupFriendViewController ()
@property (nonatomic, strong) UILabel *footerLabel;

@property (nonatomic, strong) TLFriendHelper *friendHelper;

@property (nonatomic, strong) TLSearchController *searchController;

@property (nonatomic, strong) TLDBGroupStore *groupStore;

@end

@implementation TLSelectGroupFriendViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationItem setTitle:@"选择联系人"];
    
    //初始化群成员列表
    _groupMeb = [[NSMutableArray alloc]init];
    //所有的群
    _groupsData = [[NSMutableArray alloc]init];
    //初始化path数组。。瞎搞
    _paths = [[NSArray alloc]init];
    
    [self p_initUI];        // 初始化界面UI
    [self registerCellClass];
    
    self.friendHelper = [TLFriendHelper sharedFriendHelper];      // 初始化好友数据业务类
    self.data = self.friendHelper.data;
    self.sectionHeaders = self.friendHelper.sectionHeaders;
    //self.sectionHeaders = nil;
    [self.footerLabel setText:[NSString stringWithFormat:@"%ld位联系人", (long)self.friendHelper.friendCount]];

    __weak typeof(self) weakSelf = self;
    [self.friendHelper setDataChangedBlock:^(NSMutableArray *data, NSMutableArray *headers, NSInteger friendCount) {
        weakSelf.data = data;
        weakSelf.sectionHeaders = headers;
        [weakSelf.footerLabel setText:[NSString stringWithFormat:@"%ld位联系人", (long)friendCount]];
        [weakSelf.tableView reloadData];
    }];
}

//#pragma mark - Event Response -
//- (void)rightBarButtonDown:(UIBarButtonItem *)sender
//{
//   TLAddFriendViewController *addFriendVC = [[TLAddFriendViewController alloc] init];
//    [self setHidesBottomBarWhenPushed:YES];
//    [self.navigationController pushViewController:addFriendVC animated:YES];
//    [self setHidesBottomBarWhenPushed:NO];
//}

#pragma mark - Private Methods -
- (void)p_initUI
{
    [self.tableView setLayoutMargins:UIEdgeInsetsMake(0, 10, 0, 0)];
    [self.tableView setSeparatorInset:UIEdgeInsetsMake(0, 10, 0, 0)];
    [self.tableView setSeparatorColor:[UIColor colorGrayLine]];
    [self.tableView setBackgroundColor:[UIColor whiteColor]];
    [self.tableView setSectionIndexBackgroundColor:[UIColor clearColor]];
    [self.tableView setSectionIndexColor:[UIColor colorBlackForNavBar]];
    
    //选人瞎搞
    [self.tableView setEditing:YES];
    _currentEditingStyle = UITableViewCellEditingStyleDelete | UITableViewCellEditingStyleInsert;

    UIBarButtonItem *rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"Finish" style:UIBarButtonItemStyleDone target:self action:@selector(rightBarButtonDown)];
    [self.navigationItem setRightBarButtonItem:rightBarButtonItem];
    
    
}
- (void)rightBarButtonDown
{
    
    //groupID是应该按照某种规则来的，这里我先写固定。
    int x = arc4random() % 1000;
    NSString* str = [NSString stringWithFormat:@"x%d",x];
    NSLog(@"%@**********",str);
    //新建一个群
    TLGroup* group = [[TLGroup alloc]init];
    [group setGroupID:str];
    [group setUsers:_groupMeb];
    //NSString* groupName = [_groupMeb objectAtIndex:0];
    TLUser* user0 = [_groupMeb objectAtIndex:0];
    TLUser* user1 = [_groupMeb objectAtIndex:1];
    NSString * groupName =  [NSString stringWithFormat:@"%@.%@...",user0.username,user1.username];
    [group setGroupName:groupName];
    //把该群存到数据库里
    //更新该用户的所有群
    //_groupsData = [self.groupStore groupsDataByUid:[TLUserHelper sharedHelper].userID];
    //[_groupsData addObject:group];

    
    //BOOL ok = [self.groupStore updateGroupsData:_groupsData forUid:[TLUserHelper sharedHelper].userID];
    BOOL ok = [self.groupStore addGroup:group forUid:[TLUserHelper sharedHelper].userID];
    
    if (!ok) {
        DDLogError(@"保存群数据到数据库失败!QWQ");
    }
    //查看当前群组所有群成员

    
    _groupsData = [self.groupStore groupsDataByUid:[TLUserHelper sharedHelper].userID];
    for(TLGroup* group in _groupsData){
        NSLog(@"############$");
        NSLog(@"%@",group.groupID);
        NSLog(@"%@",group.groupName);
        for(TLUser* user in group.users){
            NSLog(@"%@",user.showName);
        }
        NSLog(@"############");
    }
    
    
    //群头像,待写成一个固定的
    [group createGroupAvatarWithCompleteAction:nil];
    //新建Chat
    TLChatViewController *chatVC = [[TLChatViewController alloc] init];
    //[self setHidesBottomBarWhenPushed:YES];
    [chatVC setPartner:group];
    [self.navigationController popViewControllerAnimated:NO];
    UIViewController *vc = [[TLLaunchManager sharedInstance].rootVC childViewControllerAtIndex:0];
    [[TLLaunchManager sharedInstance].rootVC setSelectedIndex:0];
    [vc setHidesBottomBarWhenPushed:YES];
    [vc.navigationController pushViewController:chatVC animated:NO];
    
//    [vc.navigationController jz_pushViewController:chatVC animated:YES completion:^(UINavigationController *navigationController, BOOL finished) {
//        [self.navigationController popViewControllerAnimated:NO];
//    }];
    [vc setHidesBottomBarWhenPushed:NO];
    
    
    
    
    
    //进入群聊界面
    //[self.navigationController pushViewController: chatVC animated:YES];
    //[self setHidesBottomBarWhenPushed:YES];
    NSLog(@"sb");
}

- (TLDBGroupStore *)groupStore
{
    if (_groupStore == nil) {
        _groupStore = [[TLDBGroupStore alloc] init];
    }
    return _groupStore;
}

#pragma mark - Getter -
- (TLSearchController *)searchController
{
    if (_searchController == nil) {
        _searchController = [[TLSearchController alloc] initWithSearchResultsController:self.searchVC];
        [_searchController setSearchResultsUpdater:self.searchVC];
        [_searchController.searchBar setPlaceholder:@"搜索"];
        [_searchController.searchBar setDelegate:self];
        [_searchController setShowVoiceButton:YES];
    }
    return _searchController;
}

//- (TLFriendSearchViewController *)searchVC
//{
//    if (_searchVC == nil) {
//        _searchVC = [[TLFriendSearchViewController alloc] init];
//    }
//    return _searchVC;
//}

//- (UILabel *)footerLabel
//{
//    if (_footerLabel == nil) {
//        _footerLabel= [[UILabel alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 50.0f)];
//        [_footerLabel setTextAlignment:NSTextAlignmentCenter];
//        [_footerLabel setFont:[UIFont systemFontOfSize:17.0f]];
//        [_footerLabel setTextColor:[UIColor grayColor]];
//    }
//    return _footerLabel;
//}


#pragma mark - Public Methods -
- (void)registerCellClass
{
    [self.tableView registerClass:[TLFriendHeaderView class] forHeaderFooterViewReuseIdentifier:@"TLFriendHeaderView"];
    [self.tableView registerClass:[TLFriendCell class] forCellReuseIdentifier:@"TLFriendCell"];
}

#pragma mark - Delegate -
//MARK: UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.data.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{//瞎搞的
    if(section==0){
        return 0;
    }
    else{
        TLUserGroup *group = [self.data objectAtIndex:section];
        return group.count;
    }
    
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return nil;
    }
    TLUserGroup *group = [self.data objectAtIndex:section];
    TLFriendHeaderView *view = [tableView dequeueReusableHeaderFooterViewWithIdentifier:@"TLFriendHeaderView"];
    [view setTitle:group.groupName];
    return view;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TLFriendCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TLFriendCell"];
    TLUserGroup *group = [self.data objectAtIndex:indexPath.section];
    TLUser *user = [group objectAtIndex:indexPath.row];
    [cell setUser:user];
    
    if (indexPath.section == self.data.count - 1 && indexPath.row == group.count - 1){  // 最后一个cell，底部全线
        [cell setBottomLineStyle:TLCellLineStyleFill];
    }
    else {
        [cell setBottomLineStyle:indexPath.row == group.count - 1 ? TLCellLineStyleNone : TLCellLineStyleDefault];
    }
    
    return cell;
}

// 拼音首字母检索
- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView
{
    return self.sectionHeaders;
}

// 检索时空出搜索框
- (NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index
{
    if(index == 0) {
        [self.tableView scrollRectToVisible:CGRectMake(0, 0, tableView.width, tableView.height) animated:NO];
        return -1;
    }
    return index;
}

//MARK: UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return HEIGHT_FRIEND_CELL;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return 0;
    }
    return HEIGHT_HEADER;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(![_groupMeb containsObject:[TLUserHelper sharedHelper].user]){
        //把当前用户，即群主添加到_groupMeb
        [_groupMeb addObject:[TLUserHelper sharedHelper].user];
    }
    TLUser *user = [self.data[indexPath.section] objectAtIndex:indexPath.row];
    if(![_groupMeb containsObject:user]){
        [_groupMeb addObject:user];
    
    }
    NSLog(@"%@",_groupMeb);

}

-(void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath
{
    TLUser *user = [self.data[indexPath.section] objectAtIndex:indexPath.row];
    if([_groupMeb containsObject:user]){
        [_groupMeb removeObject:user];
    }
    
    NSLog(@"%@",_groupMeb);
}



//MARK: UISearchBarDelegate
- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar
{
    [self.searchVC setFriendsData:[TLFriendHelper sharedFriendHelper].friendsData];
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault animated:YES];
}

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
    [self.tabBarController.tabBar setHidden:YES];
}

- (void)searchBarTextDidEndEditing:(UISearchBar *)searchBar
{
    [self.tabBarController.tabBar setHidden:NO];
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent animated:YES];
}

- (void)searchBarBookmarkButtonClicked:(UISearchBar *)searchBar
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"语音搜索按钮" message:nil delegate:nil cancelButtonTitle:@"确定" otherButtonTitles: nil];
    [alert show];
}


//建群瞎搞。。。。
-(UITableViewCellEditingStyle) tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return _currentEditingStyle;
}






@end
