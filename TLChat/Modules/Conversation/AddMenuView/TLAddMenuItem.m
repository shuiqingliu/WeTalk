//
//  TLAddMenuItem.m
//  TLChat
//
//  Created by iOS Team on 16/3/11.
//  Copyright © 2017年 iOS Team. All rights reserved.
//

#import "TLAddMenuItem.h"

@implementation TLAddMenuItem

+ (TLAddMenuItem *)createWithType:(TLAddMneuType)type title:(NSString *)title iconPath:(NSString *)iconPath className:(NSString *)className
{
    TLAddMenuItem *item = [[TLAddMenuItem alloc] init];
    item.type = type;
    item.title = title;
    item.iconPath = iconPath;
    item.className = className;
    return item;
}

@end
