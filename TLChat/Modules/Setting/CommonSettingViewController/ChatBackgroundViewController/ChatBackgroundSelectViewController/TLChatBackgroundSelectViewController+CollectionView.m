//
//  TLChatBackgroundSelectViewController+CollectionView.m
//  TLChat
//
//  Created by iOS Team on 16/4/2.
//  Copyright © 2017年 iOS Team. All rights reserved.
//

#import "TLChatBackgroundSelectViewController+CollectionView.h"
#import "TLChatBackgroundSelectCell.h"

@implementation TLChatBackgroundSelectViewController (CollectionView)

- (void)registerCellForCollectionView:(UICollectionView *)collectionView
{
    [collectionView registerClass:[TLChatBackgroundSelectCell class] forCellWithReuseIdentifier:@"TLChatBackgroundSelectCell"];
}

#pragma mark - # Delegate
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.data.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    TLChatBackgroundSelectCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"TLChatBackgroundSelectCell" forIndexPath:indexPath];
    return cell;
}

@end
