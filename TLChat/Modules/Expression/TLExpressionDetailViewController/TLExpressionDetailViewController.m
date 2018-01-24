//
//  TLExpressionDetailViewController.m
//  TLChat
//
//  Created by iOS Team on 16/4/8.
//  Copyright © 2017年 iOS Team. All rights reserved.
//

#import "TLExpressionDetailViewController.h"
#import "TLExpressionDetailViewController+CollectionView.h"
#import "TLExpressionProxy.h"

@interface TLExpressionDetailViewController ()
{
    NSInteger kPageIndex;
}

@end

@implementation TLExpressionDetailViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.view addSubview:self.collectionView];
    
    [self registerCellForCollectionView:self.collectionView];
    
    UILongPressGestureRecognizer *longPressGR = [[UILongPressGestureRecognizer alloc] init];
    [longPressGR setMinimumPressDuration:1.0f];
    [longPressGR addTarget:self action:@selector(didLongPressScreen:)];
    [self.collectionView addGestureRecognizer:longPressGR];
    
    UITapGestureRecognizer *tapGR = [[UITapGestureRecognizer alloc] init];
    [tapGR setNumberOfTapsRequired:5];
    [tapGR setNumberOfTouchesRequired:1];
    [tapGR addTarget:self action:@selector(didTap5TimesScreen:)];
    [self.collectionView addGestureRecognizer:tapGR];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    if (self.group.data == nil) {
        [TLUIUtility showLoading:nil];
        [self p_loadData];
    }
}

- (void)setGroup:(TLEmojiGroup *)group
{
    _group = group;
    [self.navigationItem setTitle:group.groupName];
//    [self.collectionView reloadData];
}

#pragma mark - # Private Methods
- (void)p_loadData
{
    kPageIndex = 1;
    TLExpressionProxy *proxy = [[TLExpressionProxy alloc] init];
    [proxy requestExpressionGroupDetailByGroupID:self.group.groupID pageIndex:kPageIndex success:^(id data) {
        [TLUIUtility hiddenLoading];
        self.group.data = data;
        [self.collectionView reloadData];
    } failure:^(NSString *error) {
        [TLUIUtility hiddenLoading];
    }];
}

#pragma mark - # Getter
- (UICollectionView *)collectionView
{
    if (_collectionView == nil) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        _collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:layout];
        [_collectionView setBackgroundColor:[UIColor whiteColor]];
        [_collectionView setDataSource:self];
        [_collectionView setDelegate:self];
        [_collectionView setAlwaysBounceVertical:YES];
    }
    return _collectionView;
}

- (TLImageExpressionDisplayView *)emojiDisplayView
{
    if (_emojiDisplayView == nil) {
        _emojiDisplayView = [[TLImageExpressionDisplayView alloc] init];
    }
    return _emojiDisplayView;
}

@end
