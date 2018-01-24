//
//  TLInfoHeaderFooterView.m
//  TLChat
//
//  Created by iOS Team on 16/2/29.
//  Copyright © 2017年 iOS Team. All rights reserved.
//

#import "TLInfoHeaderFooterView.h"

@implementation TLInfoHeaderFooterView

- (id)initWithReuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithReuseIdentifier:reuseIdentifier]) {
        [self.contentView setBackgroundColor:[UIColor colorGrayBG]];
    }
    return self;
}

@end
