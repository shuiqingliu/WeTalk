//
//  TLGroupSearchViewController.h
//  TLChat
//
//  Created by iOS Team on 16/3/7.
//  Copyright © 2017年 iOS Team. All rights reserved.
//

#import "TLTableViewController.h"

@interface TLGroupSearchViewController : TLTableViewController <UISearchResultsUpdating, UISearchBarDelegate>

@property (nonatomic, strong) NSMutableArray *groupData;

@end
