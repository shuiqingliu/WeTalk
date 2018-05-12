//
//  TLFriendDetailViewController+Delegate.m
//  TLChat
//
//  Created by iOS Team on 16/3/17.
//  Copyright © 2017年 iOS Team. All rights reserved.
//

#import "TLFriendDetailViewController+Delegate.h"
#import "TLLaunchManager.h"
#import "TLChatViewController.h"
#import <MWPhotoBrowser.h>
#import "TLUser+ChatModel.h"
#import "TLFriendDetailAlbumCell.h"
#import "NSFileManager+TLChat.h"

#import "TLDBFriendStore.h"

@implementation TLFriendDetailViewController (Delegate)

#pragma mark - Private Methods -
- (void)registerCellClass
{
    [self.tableView registerClass:[TLFriendDetailUserCell class] forCellReuseIdentifier:@"TLFriendDetailUserCell"];
    [self.tableView registerClass:[TLFriendDetailAlbumCell class] forCellReuseIdentifier:@"TLFriendDetailAlbumCell"];
}

#pragma mark - Delegate -
//MARK: UITableViewDataSource
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TLInfo *info = [self.data[indexPath.section] objectAtIndex:indexPath.row];
    if (info.type == TLInfoTypeOther) {
        if (indexPath.section == 0) {
            TLFriendDetailUserCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TLFriendDetailUserCell"];
            [cell setDelegate:self];
            [cell setInfo:info];
            [cell setTopLineStyle:TLCellLineStyleFill];
            [cell setBottomLineStyle:TLCellLineStyleFill];
            return cell;
        }
        else {
            TLFriendDetailAlbumCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TLFriendDetailAlbumCell"];
            [cell setInfo:info];
            return cell;
        }
    }
    return [super tableView:tableView cellForRowAtIndexPath:indexPath];
}

//MARK: UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TLInfo *info = [self.data[indexPath.section] objectAtIndex:indexPath.row];
    if (info.type == TLInfoTypeOther) {
        if (indexPath.section == 0) {
            return HEIGHT_USER_CELL;
        }
        return HEIGHT_ALBUM_CELL;
    }
    return [super tableView:tableView heightForRowAtIndexPath:indexPath];
}


//MARK: TLInfoButtonCellDelegate
- (void)infoButtonCellClicked:(TLInfo *)info
{
    if ([info.title isEqualToString:@"发消息"]) {
        NSLog(@"点击了发消息按钮");
        TLChatViewController *chatVC = [[TLChatViewController alloc] init];
        if ([self.navigationController findViewController:@"TLChatViewController"]) {
            if ([[chatVC.partner chat_userID] isEqualToString:self.user.userID]) {
                [self.navigationController popToViewControllerWithClassName:@"TLChatViewController" animated:YES];
            }
            else {
                [chatVC setPartner:self.user];
                __block UINavigationController *navController = self.navigationController;
                [self.navigationController jz_popToRootViewControllerAnimated:YES completion:^(UINavigationController *navigationController, BOOL finished) {
                    if (finished) {
                        [navController pushViewController:chatVC animated:YES];
                    }
                }];
            }
        }
        else {
            [chatVC setPartner:self.user];
            NSLog(@"当前选中好友为：%@",self.user.friendID);
            UIViewController *vc = [[TLLaunchManager sharedInstance].rootVC childViewControllerAtIndex:0];
            [[TLLaunchManager sharedInstance].rootVC setSelectedIndex:0];
            [vc setHidesBottomBarWhenPushed:YES];
            [vc.navigationController jz_pushViewController:chatVC animated:YES completion:^(UINavigationController *navigationController, BOOL finished) {
                [self.navigationController popViewControllerAnimated:NO];
            }];
            [vc setHidesBottomBarWhenPushed:NO];
        }
    }
    else if ([info.title isEqualToString:@"删除好友"]) {
        NSLog(@"点击了删除好友按钮");
        UIAlertView *alView1 = [[UIAlertView alloc] initWithTitle:@"提示" message:@"确认删除好友？" delegate:nil cancelButtonTitle:@"确认" otherButtonTitles:nil];
        [alView1 show];
        TLDBFriendStore *friendStore = [[TLDBFriendStore alloc]init];
        NSString *fidToDelete = self.user.userID;
        
        NSLog(@"要删除的好友ID：%@",fidToDelete);
        //
        //
        //@-@在此处添加向服务器发送删除好友消息 代码
    }
    
    
}

//MARK: TLFriendDetailUserCellDelegate
- (void)friendDetailUserCellDidClickAvatar:(TLInfo *)info
{
    NSURL *url;
    if (self.user.avatarPath) {
        NSString *imagePath = [NSFileManager pathUserAvatar:self.user.avatarPath];
        url = [NSURL fileURLWithPath:imagePath];
    }
    else {
        url = TLURL(self.user.avatarURL);
    }

    MWPhoto *photo = [MWPhoto photoWithURL:url];
    MWPhotoBrowser *browser = [[MWPhotoBrowser alloc] initWithPhotos:@[photo]];
    UINavigationController *broserNavC = [[UINavigationController alloc] initWithRootViewController:browser];
    [self presentViewController:broserNavC animated:NO completion:nil];
}

@end
