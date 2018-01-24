//
//  TLMineViewController.h
//  TLChat
//
//  Created by iOS Team on 2017/7/6.
//  Copyright © 2017年 iOS Team. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TLMineViewController : ZZFlexibleLayoutViewController
@property (nonatomic, strong) UITableView * tableView;

- (void)updateSwitchAtIndexPath:(id)sender;
- (void)createUI;

@end
