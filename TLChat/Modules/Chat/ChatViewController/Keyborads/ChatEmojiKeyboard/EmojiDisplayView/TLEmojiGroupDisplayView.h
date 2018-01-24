//
//  TLEmojiGroupDisplayView.h
//  TLChat
//
//  Created by iOS Team on 16/9/27.
//  Copyright © 2017年 iOS Team. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TLEmojiGroupDisplayViewDelegate.h"
#import "TLEmojiGroupDisplayModel.h"

@interface TLEmojiGroupDisplayView : UIView

@property (nonatomic, weak) id<TLEmojiGroupDisplayViewDelegate> delegate;

@property (nonatomic, weak) NSMutableArray *data;

@property (nonatomic, strong) NSMutableArray *displayData;

@property (nonatomic, strong) UICollectionView *collectionView;

@property (nonatomic, assign) NSInteger curPageIndex;

- (void)scrollToEmojiGroupAtIndex:(NSInteger)index;

@end
