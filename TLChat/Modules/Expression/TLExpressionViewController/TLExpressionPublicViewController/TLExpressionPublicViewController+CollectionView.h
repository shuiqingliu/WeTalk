//
//  TLExpressionPublicViewController+CollectionView.h
//  TLChat
//
//  Created by iOS Team on 16/4/8.
//  Copyright © 2017年 iOS Team. All rights reserved.
//

#import "TLExpressionPublicViewController.h"

@interface TLExpressionPublicViewController (CollectionView) <UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

- (void)registerCellForCollectionView:(UICollectionView *)collectionView;

@end
