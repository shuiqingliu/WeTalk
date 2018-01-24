//
//  TLFriendDetailSettingViewController.m
//  TLChat
//
//  Created by iOS Team on 16/3/7.
//  Copyright © 2017年 iOS Team. All rights reserved.
//

#import "TLFriendDetailSettingViewController.h"
#import "TLFriendHelper+Detail.h"
#import "TLFriendHelper.h"

@interface TLFriendDetailSettingViewController ()

@end

@implementation TLFriendDetailSettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationItem setTitle:@"资料设置"];
    
    self.data = [[TLFriendHelper sharedFriendHelper] friendDetailSettingArrayByUserInfo:self.user];
}



@end
