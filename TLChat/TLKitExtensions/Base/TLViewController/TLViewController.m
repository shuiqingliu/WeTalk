//
//  TLViewController.m
//  TLChat
//
//  Created by iOS Team on 16/1/23.
//  Copyright © 2017年 iOS Team. All rights reserved.
//

#import "TLViewController.h"

@implementation TLViewController

- (id)init
{
    if (self = [super init]) {
        [self setStatusBarStyle:UIStatusBarStyleLightContent];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor colorGrayBG]];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [MobClick beginLogPageView:self.analyzeTitle];
    if ([UIApplication sharedApplication].statusBarStyle != self.statusBarStyle) {
        [UIApplication sharedApplication].statusBarStyle = self.statusBarStyle;
    }
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [MobClick endLogPageView:self.analyzeTitle];
}

- (void)dealloc
{
#ifdef DEBUG_MEMERY
    NSLog(@"dealloc %@", self.navigationItem.title);
#endif
}

#pragma mark - # Getter
- (NSString *)analyzeTitle
{
    if (_analyzeTitle == nil) {
        return self.navigationItem.title;
    }
    return _analyzeTitle;
}


@end
