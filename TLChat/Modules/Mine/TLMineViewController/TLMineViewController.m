//
//  TLMineViewController.m
//  TLChat
//
//  Created by iOS Team on 2017/7/6.
//  Copyright © 2017年 iOS Team. All rights reserved.
//

#import "TLMineViewController.h"
#import "TLMineViewController+Delegate.h"
#import "TLMenuItem.h"
#import "TLUser.h"
#import "TLUserHelper.h"
#import "MeCell.h"
#import "TLLaunchManager.h"
#import "TLLoginViewController.h"
#import "TLAccountAndSafetyViewController.h"
#import "SetPasswdController.h"
#import "SetMailViewController.h"
#import "SetPhoneNumberController.h"

#define     NAME_MINE_MENU_CELL     @"TLMenuItemCell"

@interface TLMineViewController () <UITableViewDelegate, UITableViewDataSource>

@end

@implementation TLMineViewController

- (id)init
{
    if (self = [super init]) {
         [self.tabBarItem setBadgeValue:@""];
    }
    return self;
}

- (void)loadView
{
    [super loadView];

    [self.navigationItem setTitle:LOCSTR(@"我")];
    
    [self createUI];
    //[self loadMenus];
}

#pragma mark - # Private Methods
- (void)loadMenus
{
    [self deleteAllItems];
    
    TLUser *user = [TLUserHelper sharedHelper].user;
    
    // 用户信息
    self.addSection(TLMineSectionTagUserInfo).sectionInsets(UIEdgeInsetsMake(15, 0, 0, 0));
    self.addCell(@"TLMineHeaderCell").toSection(TLMineCellTagUserInfo).withDataModel(user).viewTag(TLMineCellTagUserInfo);
}
    
    
    
//    // 钱包
////钱包    self.addSection(TLMineSectionTagWallet).sectionInsets(UIEdgeInsetsMake(20, 0, 0, 0));
////    TLMenuItem *wallet = createMenuItem(@"mine_wallet", LOCSTR(@"钱包"));
////    [wallet setBadge:@""];
////    self.addCell(NAME_MINE_MENU_CELL).toSection(TLMineSectionTagWallet).withDataModel(wallet).viewTag(TLMineCellTagWallet);
//
//    // 功能
//    self.addSection(TLMineSectionTagFounction).sectionInsets(UIEdgeInsetsMake(20, 0, 0, 0));
//    TLMenuItem *collect = createMenuItem(@"mine_setting", LOCSTR(@"响铃设置"));
//    //UISwitch *ringSwitch = [[UISwitch alloc]init];
//    //[ringSwitch addTarget:self action:@selector(ringSwitchChange) forControlEvents:UIControlEventValueChanged];
    
    
//    self.addCell(NAME_MINE_MENU_CELL).toSection(TLMineSectionTagFounction).withDataModel(collect).viewTag(TLMineCellTagCollect);
//    TLMenuItem *album = createMenuItem(@"mine_setting", LOCSTR(@"勿扰模式"));
//    UISwitch *ringSwitch = [[UISwitch alloc]init];
//    album.switchButton = ringSwitch;
//
//
//    self.addCell(NAME_MINE_MENU_CELL).toSection(TLMineSectionTagFounction).withDataModel(album).viewTag(TLMineCellTagAlbum);
////    TLMenuItem *card = createMenuItem(@"mine_card", LOCSTR(@"卡包"));
////    self.addCell(NAME_MINE_MENU_CELL).toSection(TLMineSectionTagFounction).withDataModel(card).viewTag(TLMineCellTagCard);
//
//    // 表情
//    self.addSection(TLMineSectionTagExpression).sectionInsets(UIEdgeInsetsMake(20, 0, 0, 0));
//    TLMenuItem *expression = createMenuItem(@"mine_setting", LOCSTR(@"修改密码"));
// //   [expression setBadge:@"NEW"];
//    self.addCell(NAME_MINE_MENU_CELL).toSection(TLMineSectionTagExpression).withDataModel(expression).viewTag(TLMineCellTagExpression);
//    TLMenuItem *emailConfig = createMenuItem(@"mine_setting", LOCSTR(@"修改邮箱"));
//
//    self.addCell(NAME_MINE_MENU_CELL).toSection(TLMineSectionTagExpression).withDataModel(emailConfig).viewTag(TLMineCellTagExpression);
//    TLMenuItem *phoneConfig = createMenuItem(@"mine_setting", LOCSTR(@"修改手机"));
//
//    self.addSection(TLMineSectionTagExpression).sectionInsets(UIEdgeInsetsMake(20, 0, 0, 0));
//   // TLMenuItem *emailConfig = createMenuItem(@"mine_setting", LOCSTR(@"表情"));
//   // [emailConfig setBadge:@"NEW"];
//    self.addCell(NAME_MINE_MENU_CELL).toSection(TLMineSectionTagExpression).withDataModel(phoneConfig).viewTag(TLMineCellTagExpression);
//
//    // 设置
//    self.addSection(TLMineSectionTagSetting).sectionInsets(UIEdgeInsetsMake(20, 0, 30, 0));
//    TLMenuItem *setting = createMenuItem(@"mine_setting", LOCSTR(@"退出登录"));
//    self.addCell(NAME_MINE_MENU_CELL).toSection(TLMineSectionTagSetting).withDataModel(setting).viewTag(TLMineCellTagSetting);
//
//    [self reloadView];
//
//    [self resetTabBarBadge];
- (void)createUI {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height - 64) style:UITableViewStyleGrouped];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.separatorInset = UIEdgeInsetsMake(0, 20, 0, 0);
        _tableView.showsVerticalScrollIndicator = NO;
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"SettingCell"];
        [_tableView registerClass:[MeCell class] forCellReuseIdentifier:@"MeCell"];
        [self.view addSubview:_tableView];
//    self.automaticallyAdjustsScrollViewInsets = false;
//    _tableView.contentInset = UIEdgeInsetsMake(140, 0, 0, 0);
    
    
    }
    
    - (void)didReceiveMemoryWarning {
        [super didReceiveMemoryWarning];
        // Dispose of any resources that can be recreated.
    }
    
#pragma mark - UITableViewDelegate
    
    - (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
        [tableView deselectRowAtIndexPath:indexPath animated:YES];
        if (indexPath.section == 2) {
            TLUserHelper *userHelper = [TLUserHelper sharedHelper];
            TLUser *user = [[TLUser alloc] init];
            user.userID = @"";
            [userHelper setUser:user];
//            TLLoginViewController *loginVC = [[TLLoginViewController alloc] init];
//            [self presentViewController:loginVC animated:YES completion:nil];
            UIWindow *window = self.view.window;
            [[TLLaunchManager sharedInstance] launchInWindow:window];
        }
        
        if (indexPath.section == 1)
        {
//            if (indexPath.row == 0)
//            {
//                TLAccountAndSafetyViewController *setingVC = [[TLAccountAndSafetyViewController alloc] init];
//                [self setHidesBottomBarWhenPushed:YES];
//                [self.navigationController pushViewController:setingVC animated:YES];
//                NSLog(@"点击更改电话");
//            }
//            [self.tableView deselectRowAtIndexPath:indexPath animated:NO];
//
//            if(indexPath.row == 2)
//            {
//                SetPasswdController *setingVC2 = [[SetPasswdController alloc] init];
//                [self setHidesBottomBarWhenPushed:NO];
//                [self.navigationController pushViewController:setingVC2 animated:YES];
//                NSLog(@"点击了修改密码操作");
//
//            }
            
            switch(indexPath.row)
            {
                case 0:
                {
                    TLAccountAndSafetyViewController *setingVC = [[SetPhoneNumberController alloc] init];
                    [self setHidesBottomBarWhenPushed:NO];
                    [self.navigationController pushViewController:setingVC animated:YES];
                    NSLog(@"点击更改电话");
                    break;
                }
                case 1:
                {
                    SetMailViewController *setingVC1 = [[SetMailViewController alloc] init];
                    [self setHidesBottomBarWhenPushed:NO];
                    [self.navigationController pushViewController:setingVC1 animated:YES];
                    NSLog(@"点击了更改邮箱操作!");
                    break;
                }
                case 2:
                {
                    SetPasswdController *setingVC2 = [[SetPasswdController alloc] init];
                    [self setHidesBottomBarWhenPushed:NO];
                    [self.navigationController pushViewController:setingVC2 animated:YES];
                    NSLog(@"点击了修改密码操作");
                }
            }
        }
        
    }
    
    - (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
        cell.textLabel.text = [self tableTitles][indexPath.section][indexPath.row];
        cell.imageView.image = [UIImage imageNamed:[self tableImages][indexPath.section][indexPath.row]];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    
    - (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
        if (indexPath.section == 0) {
            return 125;
        } else {
            return 45;
    }
    }
    
    - (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
        return 10;
    }
    
    - (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
        return 10;
    }
    
#pragma mark - UITableViewDataSource
    
    - (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
        if (indexPath.section == 0) {
            return [tableView dequeueReusableCellWithIdentifier:@"MeCell"];
        }else{
            UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"SettingCell"];
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
//            if (indexPath.section == 1) {
//                UISwitch *soundSwitch = [[UISwitch alloc]initWithFrame:CGRectZero];
//                [soundSwitch addTarget:self action:@selector(updateSwitchAtIndexPath:) forControlEvents:UIControlEventValueChanged];
//                cell.accessoryView = soundSwitch;
//                [cell addSubview:soundSwitch];
//            }
            return cell;
        }
    }

    
    
    - (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
        return [self tableTitles][section].count;
    }
    
    - (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
        return [self tableTitles].count;
    }
    
    
#pragma mark - data
    - (NSArray <NSArray *> *)tableTitles {
        return @[@[@""],
                 
//                 @[@"静音开关",
//                   @"勿扰模式"],
                 
                 @[@"更改电话",
                   @"更改邮箱",
                   @"修改密码"],
                 
                 @[@"退出登录"]];
    };
    
    - (NSArray <NSArray *> *)tableImages {
        return @[@[@""],
                 
//                 @[@"me_setting",
//                   @"me_setting"],
                 
                 @[@"me_setting",
                   @"me_setting",
                   @"me_setting"],
                 
                 @[@"me_setting"]];
    };

//
//-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
//    if (indexPath.row % 2 == 0) {
//        ViewControllerOne *oneController = [[self storyboard]instantiateViewControllerWithIdentifier:@"ViewOne"];
//        [[self navigationController] pushViewController:oneController animated:YES];
//    } else {
//        ViewControllerTwo *twoController = [[self storyboard]instantiateViewControllerWithIdentifier:@"ViewTwo"];
//        [[self navigationController] pushViewController:twoController animated:YES];
//    }
//}

@end
