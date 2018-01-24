//
//  TLTableViewController.m
//  TLChat
//
//  Created by iOS Team on 16/1/23.
//  Copyright © 2017年 iOS Team. All rights reserved.
//

#import "TLTableViewController.h"

@implementation TLTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor colorGrayBG]];
    [self.tableView setTableFooterView:[UIView new]];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    [MobClick beginLogPageView:self.analyzeTitle];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [MobClick endLogPageView:self.analyzeTitle];
}

- (void)dealloc
{
#ifdef DEBUG_MEMERY
    NSLog(@"dealloc %@", self.navigationItem.title);
#endif
}

#pragma mark - Getter -
- (NSString *)analyzeTitle
{
    if (_analyzeTitle == nil) {
        return self.navigationItem.title;
    }
    return _analyzeTitle;
}

@end
