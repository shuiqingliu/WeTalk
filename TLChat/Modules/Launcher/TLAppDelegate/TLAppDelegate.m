//
//  TLAppDelegate.m
//  TLChat
//
//  Created by iOS Team on 16/1/23.
//  Copyright © 2017年 iOS Team. All rights reserved.
//

#import "TLAppDelegate.h"
#import "TLLaunchManager.h"
#import "TLSDKManager.h"
#import "TLFriendsViewController.h"

#define ROOTVC [[[UIApplication sharedApplication] keyWindow] rootViewController]

@implementation TLAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    // 初始化第三方SDK
    [[TLSDKManager sharedInstance] launchInWindow:self.window];
    
    // 初始化UI
    [[TLLaunchManager sharedInstance] launchInWindow:self.window];
    
    // 紧急方法，可使用JSPatch重写
    [self urgentMethod];
    
    return YES;
}

- (BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<UIApplicationOpenURLOptionsKey,id> *)options{
    NSString *sharePath = [url absoluteString];
    sharePath = [sharePath stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSLog(@"%@",sharePath);
    TLFriendsViewController *friends = [[TLFriendsViewController alloc] init];
    [ROOTVC presentViewController:friends
                       animated:YES
                     completion:nil];
    
    return YES;
}

- (void)urgentMethod
{

}

@end
