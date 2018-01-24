//
//  TLPictureCarouselViewCell.m
//  TLChat
//
//  Created by iOS Team on 16/4/20.
//  Copyright © 2017年 iOS Team. All rights reserved.
//

#import "TLPictureCarouselViewCell.h"
#import <UIImageView+WebCache.h>

@interface TLPictureCarouselViewCell ()

@property (nonatomic, strong) UIImageView *imageView;

@end

@implementation TLPictureCarouselViewCell

- (id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self.contentView addSubview:self.imageView];
        
        [self p_addMasonry];
    }
    return self;
}

- (void)setModel:(id<TLPictureCarouselProtocol>)model
{
    [self.imageView sd_setImageWithURL:TLURL([model pictureURL])];
}

#pragma mark - # Private Methods
- (void)p_addMasonry
{
    [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self.contentView);
    }];
}

#pragma mark - # Getter
- (UIImageView *)imageView
{
    if (_imageView == nil) {
        _imageView = [[UIImageView alloc] init];
    }
    return _imageView;
}

@end
