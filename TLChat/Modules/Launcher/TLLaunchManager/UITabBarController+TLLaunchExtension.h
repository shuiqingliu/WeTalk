//
//  UITabBarController+TLLaunchExtension.h
//  TLChat
//
//  Created by iOS Team on 2017/9/19.
//  Copyright © 2017年 iOS Team. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITabBarController (TLLaunchExtension)

/**
 *  获取tabbarController的第Index个VC（不是navController）
 *
 *  @return navController的rootVC
 */
- (id)childViewControllerAtIndex:(NSUInteger)index;

/**
 *  获取当前VC的navController，并执行push操作
 *
 *  @return 是否成功push
 */
- (BOOL)pushViewController:(UIViewController *)viewController animated:(BOOL)animated;

@end
