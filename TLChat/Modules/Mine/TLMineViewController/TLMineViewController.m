//
//  TLMineViewController.m
//  TLChat
//
//  Created by 李伯坤 on 2017/7/6.
//  Copyright © 2017年 李伯坤. All rights reserved.
//

#import "TLMineViewController.h"
#import "TLUser.h"
#import "TLUserHelper.h"

#define     NAME_MINE_MENU_CELL     @"TLMenuItemCell"

@interface TLMineViewController ()

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
    [self loadMenus];
}

#pragma mark - # Private Methods
- (void)loadMenus
{
    [self deleteAllItems];
    
    TLUser *user = [TLUserHelper sharedHelper].user;
    


    
    [self reloadView];

}

@end
