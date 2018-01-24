//
//  SettingViewController.h
//  TLChat
//
//  Created by 张总天 on 2017/12/10.
//  Copyright © 2017年 李伯坤. All rights reserved.
//

#import "BaseViewController.h"

@interface SettingViewController : BaseViewController
@property (nonatomic, strong) UITableView * tableView;
- (void)updateSwitchAtIndexPath:(id)sender;
@end
