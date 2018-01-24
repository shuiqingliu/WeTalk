//
//  TLEmojiGroupDisplayView+CollectionView.h
//  TLChat
//
//  Created by iOS Team on 16/9/27.
//  Copyright © 2017年 iOS Team. All rights reserved.
//

#import "TLEmojiGroupDisplayView.h"

@interface TLEmojiGroupDisplayView (CollectionView) <UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>

- (void)registerCellClass;


- (NSUInteger)transformModelByRowCount:(NSInteger)rowCount colCount:(NSInteger)colCount andIndex:(NSInteger)index;

@end
