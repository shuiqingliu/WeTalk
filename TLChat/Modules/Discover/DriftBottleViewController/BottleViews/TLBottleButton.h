//
//  TLBottleButton.h
//  TLChat
//
//  Created by iOS Team on 16/2/22.
//  Copyright © 2017年 iOS Team. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, TLBottleButtonType) {
    TLBottleButtonTypeThrow,
    TLBottleButtonTypePickUp,
    TLBottleButtonTypeMine,
};

@interface TLBottleButton : UIButton

@property (nonatomic, strong) NSString *title;

@property (nonatomic, strong) NSString *iconPath;

@property (nonatomic, assign) TLBottleButtonType type;

@property (nonatomic, assign) NSUInteger msgNumber;

- (id)initWithType:(TLBottleButtonType)type title:(NSString *)title iconPath:(NSString *)iconPath;

@end
