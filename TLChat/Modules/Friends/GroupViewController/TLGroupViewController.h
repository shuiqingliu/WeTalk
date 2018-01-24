//
//  TLGroupViewController.h
//  TLChat
//
//  Created by iOS Team on 16/3/7.
//  Copyright © 2017年 iOS Team. All rights reserved.
//

#import "TLTableViewController.h"
#import "TLGroupSearchViewController.h"

@interface TLGroupViewController : TLTableViewController

@property (nonatomic, strong) NSMutableArray *data;

@property (nonatomic, strong) TLGroupSearchViewController *searchVC;

@end
