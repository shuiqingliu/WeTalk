//
//  TLExpressionChosenViewController.m
//  TLChat
//
//  Created by iOS Team on 16/4/4.
//  Copyright © 2017年 iOS Team. All rights reserved.
//

#import "TLExpressionChosenViewController.h"
#import "TLExpressionChosenViewController+TableView.h"
#import "TLExpressionChosenViewController+Proxy.h"
#import "TLExpressionSearchViewController.h"
#import "TLSearchController.h"
#import <MJRefresh.h>

@interface TLExpressionChosenViewController () <UISearchBarDelegate>

@property (nonatomic, strong) TLSearchController *searchController;
@property (nonatomic, strong) TLExpressionSearchViewController *searchVC;

@end

@implementation TLExpressionChosenViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setAutomaticallyAdjustsScrollViewInsets:NO];
    [self.tableView setFrame:CGRectMake(0, NAVBAR_HEIGHT + STATUSBAR_HEIGHT, SCREEN_WIDTH, SCREEN_HEIGHT - STATUSBAR_HEIGHT - NAVBAR_HEIGHT)];
    [self.tableView setBackgroundColor:[UIColor whiteColor]];
    [self.tableView setTableHeaderView:self.searchController.searchBar];
    
    MJRefreshAutoNormalFooter *footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreData)];
    [footer setTitle:@"正在加载..." forState:MJRefreshStateRefreshing];
    [footer setTitle:@"" forState:MJRefreshStateNoMoreData];
    [self.tableView setMj_footer:footer];
    
    [self registerCellsForTableView:self.tableView];
    [self loadDataWithLoadingView:YES];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    [TLUIUtility hiddenLoading];
}

#pragma mark - # Getter
- (TLSearchController *)searchController
{
    if (_searchController == nil) {
        _searchController = [[TLSearchController alloc] initWithSearchResultsController:self.searchVC];
        [_searchController setSearchResultsUpdater:self.searchVC];
        [_searchController.searchBar setPlaceholder:@"搜索表情"];
        [_searchController.searchBar setDelegate:self.searchVC];
    }
    return _searchController;
}

- (TLExpressionSearchViewController *)searchVC
{
    if (_searchVC == nil) {
        _searchVC = [[TLExpressionSearchViewController alloc] init];
    }
    return _searchVC;
}

@end
