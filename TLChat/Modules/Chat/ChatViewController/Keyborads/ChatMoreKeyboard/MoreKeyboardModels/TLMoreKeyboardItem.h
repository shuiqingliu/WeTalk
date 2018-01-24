//
//  TLMoreKeyboardItem.h
//  TLChat
//
//  Created by iOS Team on 16/2/18.
//  Copyright © 2017年 iOS Team. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, TLMoreKeyboardItemType) {
    TLMoreKeyboardItemTypeImage,
    TLMoreKeyboardItemTypeFile,
    TLMoreKeyboardItemTypeCamera,
    TLMoreKeyboardItemTypeVideoCall,
    TLMoreKeyboardItemTypeWallet,
    TLMoreKeyboardItemTypeTransfer,
    TLMoreKeyboardItemTypePosition,
    TLMoreKeyboardItemTypeFavorite,
    TLMoreKeyboardItemTypeBusinessCard,
    TLMoreKeyboardItemTypeVoice,
    TLMoreKeyboardItemTypeCards,
};

@interface TLMoreKeyboardItem : NSObject

@property (nonatomic, assign) TLMoreKeyboardItemType type;

@property (nonatomic, strong) NSString *title;

@property (nonatomic, strong) NSString *imagePath;

+ (TLMoreKeyboardItem *)createByType:(TLMoreKeyboardItemType)type title:(NSString *)title imagePath:(NSString *)imagePath;

@end
