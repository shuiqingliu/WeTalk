//
//  TLMoreKeyboard+CollectionView.h
//  TLChat
//
//  Created by iOS Team on 16/3/17.
//  Copyright © 2017年 iOS Team. All rights reserved.
//

#import "TLMoreKeyboard.h"

@interface TLMoreKeyboard (CollectionView) <UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>

@property (nonatomic, assign, readonly) NSInteger pageItemCount;

- (void)registerCellClass;

@end
