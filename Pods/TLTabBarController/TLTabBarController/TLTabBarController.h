//
//  TLTabBarController.h
//  TLKit
//
//  Created by iOS Team on 2017/7/18.
//  Copyright © 2017年 iOS Team. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TLTabBarController : UITabBarController

/**
 *  添加子控制器
 *
 *  @param  viewController      视图控制器
 *  @param  actionBlock         切换事件，返回是否允许切换，默认nil
 */
- (void)addChildViewController:(UIViewController *)viewController actionBlock:(BOOL (^)())actionBlock;


/**
 *  添加子控制器
 *
 *  @param  systemTabBarItem    系统tabBarItem
 *  @param  actionBlock         切换事件
 */
- (void)addPlusItemWithSystemTabBarItem:(UITabBarItem *)systemTabBarItem actionBlock:(void (^)())actionBlock;

@end
