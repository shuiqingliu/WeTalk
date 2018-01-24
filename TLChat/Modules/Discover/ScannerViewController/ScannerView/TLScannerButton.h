//
//  TLScannerButton.h
//  TLChat
//
//  Created by iOS Team on 16/2/25.
//  Copyright © 2017年 iOS Team. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, TLScannerType) {
    TLScannerTypeQR = 1,        // 扫一扫 - 二维码
    TLScannerTypeCover,         // 扫一扫 - 封面
    TLScannerTypeStreet,        // 扫一扫 - 街景
    TLScannerTypeTranslate,     // 扫一扫 - 翻译
};


@interface TLScannerButton : UIButton

@property (nonatomic, strong) NSString *title;

@property (nonatomic, strong) NSString *iconPath;

@property (nonatomic, strong) NSString *iconHLPath;

@property (nonatomic, assign) TLScannerType type;

@property (nonatomic, assign) NSUInteger msgNumber;

- (id)initWithType:(TLScannerType)type title:(NSString *)title iconPath:(NSString *)iconPath iconHLPath:(NSString *)iconHLPath;

@end
