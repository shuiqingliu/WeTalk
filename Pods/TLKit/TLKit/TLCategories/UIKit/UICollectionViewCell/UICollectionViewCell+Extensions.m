//
//  UICollectionViewCell+Extensions.m
//  TLChat
//
//  Created by iOS Team on 2017/7/17.
//  Copyright © 2017年 iOS Team. All rights reserved.
//

#import "UICollectionViewCell+Extensions.h"

@implementation UICollectionViewCell (Extensions)

- (void)setSelectedBackgrounColor:(UIColor *)selectedBackgrounColor
{
    UIView *selectedBGView = [[UIView alloc] init];
    [selectedBGView setBackgroundColor:selectedBackgrounColor];
    [self setSelectedBackgroundView:selectedBGView];
}
- (UIColor *)selectedBackgrounColor
{
    return self.selectedBackgroundView.backgroundColor;
}

@end
