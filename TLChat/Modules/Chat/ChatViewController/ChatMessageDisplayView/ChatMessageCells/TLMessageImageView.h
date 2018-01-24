//
//  TLMessageImageView.h
//  TLChat
//
//  Created by iOS Team on 16/3/15.
//  Copyright © 2017年 iOS Team. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TLMessageImageView : UIImageView

@property (nonatomic, strong) UIImage *backgroundImage;

/**
 *  设置消息图片（规则：收到消息时，先下载缩略图到本地，再添加到列表显示，并自动下载大图）
 *
 *  @param imagePath    缩略图Path
 *  @param imageURL     高清图URL
 */
- (void)setThumbnailPath:(NSString *)imagePath highDefinitionImageURL:(NSString *)imageURL;

@end
