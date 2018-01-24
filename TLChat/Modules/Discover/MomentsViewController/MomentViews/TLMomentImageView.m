//
//  TLMomentImageView.m
//  TLChat
//
//  Created by iOS Team on 16/4/23.
//  Copyright © 2017年 iOS Team. All rights reserved.
//

#import "TLMomentImageView.h"
#import "TLMomentDetailImagesView.h"

@interface TLMomentImageView ()

@property (nonatomic, strong) TLMomentDetailImagesView *detailView;

@end

@implementation TLMomentImageView

- (id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self.detailContainerView addSubview:self.detailView];
        
        [self.detailView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(self.detailContainerView);
        }];
    }
    return self;
}

- (void)setMoment:(TLMoment *)moment
{
    [super setMoment:moment];
    [self.detailView setDetail:moment.detail];
}

- (void)setDelegate:(id<TLMomentViewDelegate>)delegate
{
    [super setDelegate:delegate];
    [self.detailView setDelegate:delegate];
}

#pragma mark - # Getter
- (TLMomentDetailImagesView *)detailView
{
    if (_detailView == nil) {
        _detailView = [[TLMomentDetailImagesView alloc] init];
    }
    return _detailView;
}

@end
