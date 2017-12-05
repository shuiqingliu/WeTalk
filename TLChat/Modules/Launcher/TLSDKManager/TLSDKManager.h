

#import <Foundation/Foundation.h>

@interface TLSDKManager : NSObject

+ (TLSDKManager *)sharedInstance;

/**
 *  启动，初始化
 */
- (void)launchInWindow:(UIWindow *)window;

- (instancetype)init NS_UNAVAILABLE;
+ (instancetype)new NS_UNAVAILABLE;

@end
