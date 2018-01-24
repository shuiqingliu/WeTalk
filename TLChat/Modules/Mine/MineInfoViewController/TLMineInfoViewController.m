//
//  TLMineInfoViewController.m
//  TLChat
//
//  Created by iOS Team on 16/2/10.
//  Copyright © 2017年 iOS Team. All rights reserved.
//

#import "TLMineInfoViewController.h"
#import "TLMineInfoAvatarCell.h"
#import "TLMyQRCodeViewController.h"
#import "TLUserHelper.h"


@implementation TLMineInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationItem setTitle:@"个人信息"];
    
    [self.tableView registerClass:[TLMineInfoAvatarCell class] forCellReuseIdentifier:@"TLMineInfoAvatarCell"];
    
    [self p_initMineInfoData];
}

#pragma mark - # Delegate
//MARK: UITableViewDataSource
- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TLSettingItem *item = [self.data[indexPath.section] objectAtIndex:indexPath.row];
    if ([item.title isEqualToString:@"头像"]) {
        TLMineInfoAvatarCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TLMineInfoAvatarCell"];
        [cell setItem:item];
        return cell;
    }
    return [super tableView:tableView cellForRowAtIndexPath:indexPath];
}

//MARK: UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    TLSettingItem *item = [self.data[indexPath.section] objectAtIndex:indexPath.row];
    if ([item.title isEqualToString:@"我的二维码"]) {
        TLMyQRCodeViewController *myQRCodeVC = [[TLMyQRCodeViewController alloc] init];
        [self setHidesBottomBarWhenPushed:YES];
        [self.navigationController pushViewController:myQRCodeVC animated:YES];
    }
    [self.tableView deselectRowAtIndexPath:indexPath animated:NO];
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TLSettingItem *item = [self.data[indexPath.section] objectAtIndex:indexPath.row];
    if ([item.title isEqualToString:@"头像"]) {
        return 85.0f;
    }
    return [super tableView:tableView heightForRowAtIndexPath:indexPath];
}

#pragma mark - # Private Methods
- (void)p_initMineInfoData
{
    TLUser *userInfo = [TLUserHelper sharedHelper].user;
    
    TLSettingItem *avatar = TLCreateSettingItem(@"头像");
    avatar.rightImageURL = userInfo.avatarURL;
    TLSettingItem *nikename = TLCreateSettingItem(@"名字");
    nikename.subTitle = userInfo.nikeName.length > 0 ? userInfo.nikeName : @"未设置";
    TLSettingItem *username = TLCreateSettingItem(@"微信号");
    if (userInfo.username.length > 0) {
        username.subTitle = userInfo.username;
        username.showDisclosureIndicator = NO;
        username.disableHighlight = YES;
    }
    else {
        username.subTitle = @"未设置";
    }
    
    TLSettingItem *qrCode = TLCreateSettingItem(@"我的二维码");
    qrCode.rightImagePath = @"mine_cell_myQR";
    TLSettingItem *location = TLCreateSettingItem(@"我的地址");
    TLSettingGroup *group1 = TLCreateSettingGroup(nil, nil, (@[avatar, nikename, username, qrCode, location]));
    
    TLSettingItem *sex = TLCreateSettingItem(@"性别");
    sex.subTitle = userInfo.detailInfo.sex;
    TLSettingItem *city = TLCreateSettingItem(@"地区");
    city.subTitle = userInfo.detailInfo.location;
    TLSettingItem *motto = TLCreateSettingItem(@"个性签名");
    motto.subTitle = userInfo.detailInfo.motto.length > 0 ? userInfo.detailInfo.motto : @"未填写";
    TLSettingGroup *group2 = TLCreateSettingGroup(nil, nil, (@[sex, city, motto]));
    
    self.data = @[group1, group2].mutableCopy;
}

@end
