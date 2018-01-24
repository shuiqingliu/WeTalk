//
//  TLMoreKeyboardItem.m
//  TLChat
//
//  Created by iOS Team on 16/2/18.
//  Copyright © 2017年 iOS Team. All rights reserved.
//

#import "TLMoreKeyboardItem.h"

@implementation TLMoreKeyboardItem


+ (TLMoreKeyboardItem *)createByType:(TLMoreKeyboardItemType)type title:(NSString *)title imagePath:(NSString *)imagePath
{
    TLMoreKeyboardItem *item = [[TLMoreKeyboardItem alloc] init];
    item.type = type;
    item.title = title;
    item.imagePath = imagePath;
    return item;
}

@end
