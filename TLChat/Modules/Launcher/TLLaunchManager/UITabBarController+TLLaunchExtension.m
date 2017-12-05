
#import "UITabBarController+TLLaunchExtension.h"

@implementation UITabBarController (TLLaunchExtension)

- (id)childViewControllerAtIndex:(NSUInteger)index
{
    if (index < self.childViewControllers.count) {
        UIViewController *vc = self.childViewControllers[index];
        if ([vc isKindOfClass:[UINavigationController class]] || [vc isMemberOfClass:[UINavigationController class]]) {
            return [(UINavigationController *)vc rootViewController];
        }
    }
    return nil;
}

- (BOOL)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (self.selectedIndex < self.childViewControllers.count) {
        UIViewController *vc = self.childViewControllers[self.selectedIndex];
        if ([vc isKindOfClass:[UINavigationController class]]) {
            [(UINavigationController *)vc pushViewController:viewController animated:animated];
            return YES;
        }
    }
    return NO;
}

@end
