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
#import "MessageKit.h"
#import "MessageTrans.h"

#define ROOTVC [[[UIApplication sharedApplication] keyWindow] rootViewController]
@interface TLAppDelegate()

@property (nonatomic,strong) MessageTrans *messageTrans;

@end

@implementation TLAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    // 初始化第三方SDK
    [[TLSDKManager sharedInstance] launchInWindow:self.window];
    
    // 初始化UI
    [[TLLaunchManager sharedInstance] launchInWindow:self.window];
    
    //登录
    self.messageTrans = [MessageTrans sharedInstance];
    [self.messageTrans createSocketConnect];
    NSString *userID = [[TLUserHelper sharedHelper]userID];
    MessageKit *loginMessage = [[MessageKit alloc]initWithParament:@"login" from:userID to:@"login-server" content:@"就是欣一下啊啊!!!"];
    NSString *login = [loginMessage getJsonData];
    [self.messageTrans sendMessageWithString:login];
    
    // TODO:发送登录消息给服务器，等构造消息的类完成后添加响应逻辑
    
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
