//
//  BaseViewController.h
//  TLChat
//
//  Created by 张总天 on 2017/12/10.
//  Copyright © 2017年 李伯坤. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseViewController : UIViewController
- (void)setRightBarButtonItemWithImageName:(NSString *)imageName
                                    target:(id)target
                                    action:(SEL)action;
@end
