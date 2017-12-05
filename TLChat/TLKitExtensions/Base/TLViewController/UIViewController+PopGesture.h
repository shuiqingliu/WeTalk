#import <UIKit/UIKit.h>

@interface UIViewController (PopGesture) <UIGestureRecognizerDelegate>

/// 禁用手势返回（默认为NO）
@property (nonatomic, assign) BOOL disablePopGesture;

@end
