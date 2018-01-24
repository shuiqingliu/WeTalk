//
//  TLVideoMessage.h
//  TLChat
//
//  Created by iOS Team on 16/10/1.
//  Copyright © 2017年 iOS Team. All rights reserved.
//

#import "TLMessage.h"

@interface TLVideoMessage : TLMessage

@property (nonatomic, strong, readonly) NSString *videoPath;
@property (nonatomic, strong) NSString *videoURL;

@property (nonatomic, strong, readonly) NSString *imagePath;                  // 本地图片Path
@property (nonatomic, strong) NSString *imageURL;                   // 网络图片URL
@property (nonatomic, assign) CGSize imageSize;

@end
