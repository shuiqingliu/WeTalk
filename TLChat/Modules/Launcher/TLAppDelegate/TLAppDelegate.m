#import "TLAppDelegate.h"
#import "TLLaunchManager.h"
#import "TLSDKManager.h"

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

- (void)urgentMethod
{

}

@end
