//
//  TLImageBrowserController.h
//  TLChat
//
//  Created by iOS Team on 16/5/1.
//  Copyright © 2017年 iOS Team. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TLImageBrowserController : UIViewController

@property (nonatomic, strong) NSArray *images;

@property (nonatomic, assign) NSInteger curIndex;

- (id)initWithImages:(NSArray *)images curImageIndex:(NSInteger)index curImageRect:(CGRect)rect;

- (void)show;

@end
