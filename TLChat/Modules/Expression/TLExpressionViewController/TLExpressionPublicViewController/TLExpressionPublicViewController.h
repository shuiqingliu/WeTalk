//
//  TLExpressionPublicViewController.h
//  TLChat
//
//  Created by iOS Team on 16/4/8.
//  Copyright © 2017年 iOS Team. All rights reserved.
//

#import "TLViewController.h"

@interface TLExpressionPublicViewController : TLViewController
{
    NSInteger kPageIndex;
}

@property (nonatomic, strong) NSMutableArray *data;

@property (nonatomic, strong) UICollectionView *collectionView;

@end
