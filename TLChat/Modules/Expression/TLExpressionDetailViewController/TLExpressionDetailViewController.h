//
//  TLExpressionDetailViewController.h
//  TLChat
//
//  Created by iOS Team on 16/4/8.
//  Copyright © 2017年 iOS Team. All rights reserved.
//

#import "TLViewController.h"
#import "TLImageExpressionDisplayView.h"
#import "TLEmojiGroup.h"

@interface TLExpressionDetailViewController : TLViewController

@property (nonatomic, strong) TLEmojiGroup *group;

@property (nonatomic, strong) UICollectionView *collectionView;

@property (nonatomic, strong) TLImageExpressionDisplayView *emojiDisplayView;

@end
