//
//  TLFriendSearchViewController.m
//  TLChat
//
//  Created by iOS Team on 16/1/25.
//  Copyright © 2017年 iOS Team. All rights reserved.
//

#import "TLFriendSearchViewController.h"
#import "TLFriendCell.h"
#import "TLDBMessageStore.h"
#import "TLConversationCell.h"
#import "TLFriendSearchCell.h"
#import "TLChatViewController.h"
#import "TLLaunchManager.h"
#import "TLConversationViewController.h"


@interface TLFriendSearchViewController ()

@property (nonatomic, strong) NSMutableArray *data;

//消息wky
@property (nonatomic,strong) TLDBMessageStore* dbmessage;

@end

@implementation TLFriendSearchViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.data = [[NSMutableArray alloc] init];;
    [self.tableView registerClass:[TLFriendSearchCell class] forCellReuseIdentifier:@"FriendSearchCell"];
    
    [self setAutomaticallyAdjustsScrollViewInsets:NO];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.tableView.y = NAVBAR_HEIGHT + STATUSBAR_HEIGHT;
    self.tableView.height = SCREEN_HEIGHT - self.tableView.y;
}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.data.count;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return @"聊天记录搜索";
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TLFriendCell *cell = [tableView dequeueReusableCellWithIdentifier:@"FriendSearchCell"];
    
    TLUser *user = [self.data objectAtIndex:indexPath.row];
    [cell setUser:user];
    [cell setTopLineStyle:(indexPath.row == 0 ? TLCellLineStyleFill : TLCellLineStyleNone)];
    [cell setBottomLineStyle:(indexPath.row == self.data.count - 1 ? TLCellLineStyleFill : TLCellLineStyleDefault)];
    return cell;
}

#pragma mark - Delegate -
//MARK: UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return HEIGHT_FRIEND_CELL;
}

//MARK: UISearchResultsUpdating
- (void)updateSearchResultsForSearchController:(UISearchController *)searchController {
    NSString *searchText = [searchController.searchBar.text lowercaseString];
    [self.data removeAllObjects];
    _dbmessage = [[TLDBMessageStore alloc]init];
    //NSMutableArray* temp = [_dbmessage allMessagesByUserID:@"1001" partnerID:@"1003"];
    NSMutableArray* temp = [_dbmessage allMessages];
   NSLog(@"%lu",temp.count);
   
//    [self.tableView reloadData];
    
    for (TLUser *user in self.friendsData) {
//       if ([user.remarkName containsString:searchText] || [user.username containsString:searchText] || [user.nikeName containsString:searchText] || [user.pinyin containsString:searchText] || [user.pinyinInitial containsString:searchText]) {
//            [self.data addObject:user];
//        }
        for(TLMessage * t in temp){
            NSString* mess=[t.content objectForKey:@"text"];
            //  NSLog(@"%@", mess);
            if([mess containsString:searchText]){
                NSString *messageInfo = mess;
                NSLog(@"循环里的info：%@",messageInfo);
                TLFriendSearchCell *tlfs = [[TLFriendSearchCell alloc] initWithUserInfo:messageInfo];
                if(user.userID == t.friendID){
                [self.data addObject:user];
                    break;
                }
            }
        }
    }
    [self.tableView reloadData];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    TLUser *user = [self.data objectAtIndex:indexPath.row];
    NSLog(@"我选择的聊天人是：%@",user.remarkName);
    //触发代理事件；
    [_delegate cancelSearch:user];
//    TLChatViewController *chatVC = [[TLChatViewController alloc] init];
//    [chatVC setPartner:user];
//    UIViewController *vc = [[TLLaunchManager sharedInstance].rootVC childViewControllerAtIndex:0];
//    [[TLLaunchManager sharedInstance].rootVC setSelectedIndex:0];
//    NSLog(@"当前界面的名字是：%@",vc.navigationItem.title);
//    [vc setHidesBottomBarWhenPushed:YES];
//    [vc.navigationController pushViewController:chatVC animated:NO];
//    [vc setHidesBottomBarWhenPushed:NO];

    
//    (TLConversationViewController *)vc.searchController 
    //self.active = false;
    //super.delegate.active = false;
    
    //[self.searchController setActive:FALSE];
    //[self setHidesBottomBarWhenPushed:NO];
//    [vc.navigationController jz_pushViewController:chatVC animated:YES completion:^(UINavigationController *navigationController, BOOL finished) {
//        [self.navigationController popViewControllerAnimated:NO];
//    }];
    
}

@end
