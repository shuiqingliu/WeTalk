//
//  TLEmojiDisplayView.h
//  TLChat
//
//  Created by iOS Team on 16/3/16.
//  Copyright © 2017年 iOS Team. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TLEmoji.h"

@interface TLEmojiDisplayView : UIImageView

@property (nonatomic, strong) TLEmoji *emoji;

@property (nonatomic, assign) CGRect rect;

- (void)displayEmoji:(TLEmoji *)emoji atRect:(CGRect)rect;

@end
