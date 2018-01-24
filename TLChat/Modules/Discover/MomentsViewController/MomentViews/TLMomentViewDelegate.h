//
//  TLMomentViewDelegate.h
//  TLChat
//
//  Created by iOS Team on 16/5/2.
//  Copyright © 2017年 iOS Team. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol TLMomentMultiImageViewDelegate <NSObject>

- (void)momentViewClickImage:(NSArray *)images atIndex:(NSInteger)index;

@end


@protocol TLMomentDetailViewDelegate <TLMomentMultiImageViewDelegate>

@end


@protocol TLMomentViewDelegate <TLMomentDetailViewDelegate>

@end
