//
//  TLTextMessage.h
//  TLChat
//
//  Created by libokun on 16/3/28.
//  Copyright © 2017年 iOS Team. All rights reserved.
//

#import "TLMessage.h"

@interface TLTextMessage : TLMessage

@property (nonatomic, strong) NSString *text;                       // 文字信息

@property (nonatomic, strong) NSAttributedString *attrText;         // 格式化的文字信息（仅展示用）

@end
