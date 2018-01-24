//
//  TLContactsSearchViewController.h
//  TLChat
//
//  Created by iOS Team on 16/3/8.
//  Copyright © 2017年 iOS Team. All rights reserved.
//

#import "TLTableViewController.h"

@interface TLContactsSearchViewController : TLTableViewController <UISearchResultsUpdating>

@property (nonatomic, strong) NSArray *contactsData;

@end
