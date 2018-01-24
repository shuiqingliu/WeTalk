//
//  TLSettingFooterTitleView.m
//  TLChat
//
//  Created by iOS Team on 16/2/10.
//  Copyright © 2017年 iOS Team. All rights reserved.
//

#import "TLSettingFooterTitleView.h"

@implementation TLSettingFooterTitleView

- (id)initWithReuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithReuseIdentifier:reuseIdentifier]) {
        [self.titleLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.contentView).mas_offset(15);
            make.right.mas_equalTo(self.contentView).mas_offset(-15);
            make.top.mas_equalTo(self.contentView).mas_offset(5.0f);
        }];
    }
    return self;
}

@end
