//
//  TLMoment.m
//  TLChat
//
//  Created by iOS Team on 16/4/7.
//  Copyright © 2017年 iOS Team. All rights reserved.
//

#import "TLMoment.h"

#define     HEIGHT_MOMENT_DEFAULT       76.0f

@implementation TLMoment

- (id)init
{
    if (self = [super init]) {
        [TLMoment mj_setupObjectClassInArray:^NSDictionary *{
            return @{ @"user" : @"TLUser",
                      @"detail" : @"TLMomentDetail",
                      @"extension" : @"TLMomentExtension"};
        }];
    }
    return self;
}

#pragma mark - # Getter
- (TLMomentFrame *)momentFrame
{
    if (_momentFrame == nil) {
        _momentFrame = [[TLMomentFrame alloc] init];
        _momentFrame.height = HEIGHT_MOMENT_DEFAULT;
        _momentFrame.height += _momentFrame.heightDetail = self.detail.detailFrame.height;  // 正文高度
        _momentFrame.height += _momentFrame.heightExtension = self.extension.extensionFrame.height;   // 拓展高度
    }
    return _momentFrame;
}

@end


@implementation TLMomentFrame

@end
