//
//  SettingViewController.m
//  TLChat
//
//  Created by 张总天 on 2017/12/10.
//  Copyright © 2017年 李伯坤. All rights reserved.
//

#import "SettingViewController.h"

@interface SettingViewController () <UITableViewDelegate, UITableViewDataSource>


@end

@implementation SettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)createUI {
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height - 64) style:UITableViewStyleGrouped];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.separatorInset = UIEdgeInsetsMake(0, 20, 0, 0);
    _tableView.showsVerticalScrollIndicator = NO;
    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"SettingCell"];
    //[_tableView registerClass:[MeCell class] forCellReuseIdentifier:@"MeCell"];
    [self.view addSubview:_tableView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    cell.textLabel.text = [self tableTitles][indexPath.section][indexPath.row];
    cell.imageView.image = [UIImage imageNamed:[self tableImages][indexPath.section][indexPath.row]];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        return 127;
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
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"SettingCell"];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    if (indexPath.section == 1) {
        UISwitch *soundSwitch = [[UISwitch alloc]initWithFrame:CGRectZero];
        [soundSwitch addTarget:self action:@selector(updateSwitchAtIndexPath:) forControlEvents:UIControlEventValueChanged];
        cell.accessoryView = soundSwitch;
        [cell addSubview:soundSwitch];
    }
    return cell;
}

- (void)updateSwitchAtIndexPath:(id)sender
{
    UISwitch *switchView = (UISwitch *)sender;
    if ([switchView isOn])
    {
        NSLog(@"静音开关已打开");
    }
    else
    {
        NSLog(@"静音开关关闭");
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
             
             @[@"静音开关",
               @"勿扰模式"],
             
             @[@"更改电话",
               @"更改邮箱",
               @"修改密码"],
             
             @[@"退出登录"]];
};

- (NSArray <NSArray *> *)tableImages {
    return @[@[@""],
             
             @[@"me_setting",
               @"me_setting"],
             
             @[@"me_setting",
               @"me_setting",
               @"me_setting"],
             
             @[@"me_setting"]];
};


@end
