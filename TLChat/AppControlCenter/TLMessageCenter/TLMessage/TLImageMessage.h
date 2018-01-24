//
//  TLImageMessage.h
//  TLChat
//
//  Created by libokun on 16/3/28.
//  Copyright © 2017年 iOS Team. All rights reserved.
//

#import "TLMessage.h"

@interface TLImageMessage : TLMessage

@property (nonatomic, strong) NSString *imagePath;                  // 本地图片Path
@property (nonatomic, strong) NSString *imageURL;                   // 网络图片URL
@property (nonatomic, assign) CGSize imageSize;

@end
