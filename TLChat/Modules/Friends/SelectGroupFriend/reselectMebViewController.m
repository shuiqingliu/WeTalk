//
//  reselectMebViewController.m
//  TLChat
//
//  Created by wky on 07/01/2018.
//  Copyright © 2018 . All rights reserved.
//

#import "reselectMebViewController.h"
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
@interface reselectMebViewController ()
@property (nonatomic, strong) UILabel *footerLabel;

@property (nonatomic, strong) TLFriendHelper *friendHelper;

@property (nonatomic, strong) TLSearchController *searchController;

@property (nonatomic, strong) TLDBGroupStore *groupStore;
@end

@implementation reselectMebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationItem setTitle:@"选择联系人"];
    
    //该数组用来存再次选中的所有的人
    _groupMeb = [[NSMutableArray alloc]init];

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




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source
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
    //按下Finish按钮时，触发代理事件；
    [_delegate addGroupMeb:_groupMeb];
    //从视图控制器弹出当前的视图
    //[self.navigationController popViewControllerAnimated:YES];

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
    TLUser *user = [self.data[indexPath.section] objectAtIndex:indexPath.row];
    [_groupMeb addObject:user];
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
