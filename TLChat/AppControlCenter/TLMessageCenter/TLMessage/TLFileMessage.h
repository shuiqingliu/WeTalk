//
//  TLFileMessage.h
//  TLChat
//
//  Created by qingliu on 12/24/17.
//  Copyright © 2017 李伯坤. All rights reserved.
//

#import "TLMessage.h"

@interface TLFileMessage : TLMessage

@property (nonatomic, strong) NSString *fileName;                  // 文件名字
@property (nonatomic, strong) NSString *fileSize;                   // file size
@property (nonatomic, assign) CGSize imageSize;

@end
