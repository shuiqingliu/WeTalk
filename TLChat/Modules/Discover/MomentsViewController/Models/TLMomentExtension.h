//
//  TLMomentExtension.h
//  TLChat
//
//  Created by iOS Team on 16/4/8.
//  Copyright © 2017年 iOS Team. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TLMomentComment.h"

@interface TLMomentExtensionFrame : NSObject

@property (nonatomic, assign) CGFloat height;

@property (nonatomic, assign) CGFloat heightLiked;

@property (nonatomic, assign) CGFloat heightComments;

@end



@interface TLMomentExtension : NSObject

@property (nonatomic, strong) NSMutableArray *likedFriends;

@property (nonatomic, strong) NSMutableArray *comments;

@property (nonatomic, strong) TLMomentExtensionFrame *extensionFrame;

@end
