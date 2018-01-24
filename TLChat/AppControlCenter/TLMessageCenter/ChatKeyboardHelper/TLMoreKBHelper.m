//
//  TLMoreKBHelper.m
//  TLChat
//
//  Created by iOS Team on 16/2/18.
//  Copyright © 2017年 iOS Team. All rights reserved.
//

#import "TLMoreKBHelper.h"
#import "TLMoreKeyboardItem.h"

@implementation TLMoreKBHelper

- (id)init
{
    if (self = [super init]) {
        self.chatMoreKeyboardData = [[NSMutableArray alloc] init];
        [self p_initTestData];
    }
    return self;
}

- (void)p_initTestData
{
    TLMoreKeyboardItem *imageItem = [TLMoreKeyboardItem createByType:TLMoreKeyboardItemTypeImage
                                                               title:@"照片"
                                                           imagePath:@"moreKB_image"];
    TLMoreKeyboardItem *fileItem = [TLMoreKeyboardItem createByType:TLMoreKeyboardItemTypeFile
                                                               title:@"文件"
                                                           imagePath:@"moreKB_wallet"];
    [self.chatMoreKeyboardData addObjectsFromArray:@[imageItem, fileItem]];
}

@end
