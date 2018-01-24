//
//  TLExpressionDetailViewController+CollectionView.h
//  TLChat
//
//  Created by iOS Team on 16/4/8.
//  Copyright © 2017年 iOS Team. All rights reserved.
//

#import "TLExpressionDetailViewController.h"
#import "TLExpressionDetailCell.h"

@interface TLExpressionDetailViewController (CollectionView) <UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, TLExpressionDetailCellDelegate>

- (void)registerCellForCollectionView:(UICollectionView *)collectionView;

- (void)didLongPressScreen:(UILongPressGestureRecognizer *)sender;

- (void)didTap5TimesScreen:(UITapGestureRecognizer *)sender;


@end
