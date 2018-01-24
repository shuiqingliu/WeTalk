//
//  TLChatBackgroundSelectViewController+CollectionView.h
//  TLChat
//
//  Created by iOS Team on 16/4/2.
//  Copyright © 2017年 iOS Team. All rights reserved.
//

#import "TLChatBackgroundSelectViewController.h"

@interface TLChatBackgroundSelectViewController (CollectionView) <UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>

- (void)registerCellForCollectionView:(UICollectionView *)collectionView;

@end
