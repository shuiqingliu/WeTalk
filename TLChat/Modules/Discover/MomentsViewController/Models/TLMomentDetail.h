//
//  TLMomentDetail.h
//  TLChat
//
//  Created by libokun on 16/4/8.
//  Copyright © 2017年 iOS Team. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TLMomentDetailFrame : NSObject

@property (nonatomic, assign) CGFloat height;

@property (nonatomic, assign) CGFloat heightText;

@property (nonatomic, assign) CGFloat heightImages;

@end


@interface TLMomentDetail : NSObject

@property (nonatomic, strong) NSString *text;

@property (nonatomic, strong) NSMutableArray *images;

@property (nonatomic, strong) TLMomentDetailFrame *detailFrame;

@end
