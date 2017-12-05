#import <UIKit/UIKit.h>
#import "UIViewController+PopGesture.h"

@interface TLViewController : UIViewController

@property (nonatomic, strong) NSString *analyzeTitle;

/// 当前VC stutusBar的状态，仅在viewWillAppear时生效，默认LightContent
@property (nonatomic, assign) UIStatusBarStyle statusBarStyle;

@end
