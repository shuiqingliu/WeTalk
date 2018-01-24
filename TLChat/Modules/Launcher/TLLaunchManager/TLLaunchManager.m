//
//  TLLaunchManager.m
//  TLChat
//
//  Created by iOS Team on 2017/9/19.
//  Copyright © 2017年 iOS Team. All rights reserved.
//

#import "TLLaunchManager.h"
#import "TLLaunchManager+UserData.h"

#import "TLAccountViewController.h"

#import "TLConversationViewController.h"
#import "TLFriendsViewController.h"
#import "TLDiscoverViewController.h"
#import "TLMineViewController.h"
#import "MessageTrans.h"
#import "TLUserHelper.h"

@interface TLLaunchManager()

@property (nonatomic,strong) MessageTrans *messageTrans;

@end

@implementation TLLaunchManager
@synthesize rootVC = _rootVC;

+ (TLLaunchManager *)sharedInstance
{
    static TLLaunchManager *rootVCManager;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        rootVCManager = [[self alloc] init];
    });
    return rootVCManager;
}

- (void)launchInWindow:(UIWindow *)window
{
    [window removeAllSubviews];
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    
    UIViewController *rootVC;
    if ([TLUserHelper sharedHelper].isLogin) {      // 已登录
        [self p_resetRootVC];
        rootVC = self.rootVC;
        // 初始化用户信息
        [self initUserData];
    }
    else {  // 未登录
        rootVC = [[TLAccountViewController alloc] init];
        @weakify(self);
        [(TLAccountViewController *)rootVC setLoginSuccess:^{
            @strongify(self);
            [self launchInWindow:window];
        }];
    }
    
    [window setRootViewController:rootVC];
    [window addSubview:rootVC.view];
    [window makeKeyAndVisible];
    [self.messageTrans createSocketConnect];
    
    // TODO:发送登录消息给服务器，等构造消息的类完成后添加响应逻辑
}

#pragma mark - # Private Methods
- (void)p_resetRootVC
{
    _rootVC = nil;
    
    addBarChildViewController(self.rootVC, [[TLConversationViewController alloc] init], @"消息", @"tabbar_mainframe", @"tabbar_mainframeHL");
    addBarChildViewController(self.rootVC, [[TLFriendsViewController alloc] init], @"通讯录", @"tabbar_contacts", @"tabbar_contactsHL");
    //addBarChildViewController(self.rootVC, [[TLDiscoverViewController alloc] init], @"发现", @"tabbar_discover", @"tabbar_discoverHL");
    addBarChildViewController(self.rootVC, [[TLMineViewController alloc] init], @"我", @"tabbar_me", @"tabbar_meHL");
}

#pragma mark - # Getters
- (TLTabBarController *)rootVC
{
    if (!_rootVC) {
        _rootVC = [[TLTabBarController alloc] init];
        [_rootVC.tabBar setBackgroundColor:[UIColor  colorWithRed:35.0/255 green:106.0/255 blue:245.0/255 alpha:1.0]];
        [_rootVC.tabBar setTintColor:[UIColor colorWithRed:35.0/255 green:106.0/255 blue:245.0/255 alpha:1.0]];
    }
    return _rootVC;
}

void addBarChildViewController(UITabBarController *tabBarController, UIViewController *vc, NSString *title, NSString *image, NSString *imageHL)
{
    [vc.tabBarItem setTitle:title];
    [vc.tabBarItem setImage:[UIImage imageNamed:image]];
    [vc.tabBarItem setSelectedImage:[UIImage imageNamed:imageHL]];
    UINavigationController *navC = [[UINavigationController alloc] initWithRootViewController:vc];
    [tabBarController addChildViewController:navC];
}

- (MessageTrans *)messageTrans{
    if (!_messageTrans) {
        _messageTrans = [[MessageTrans alloc] init];
        [_messageTrans setChatContentSendMessage:^(NSString *message){
            NSLog(@"%@",message);
        }];
    }
    return _messageTrans;
}

@end

