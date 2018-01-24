//
//  TLMomentsViewController+TableView.h
//  TLChat
//
//  Created by iOS Team on 16/4/5.
//  Copyright © 2017年 iOS Team. All rights reserved.
//

#import "TLMomentsViewController.h"
#import "TLMomentViewDelegate.h"

@interface TLMomentsViewController (TableView) <TLMomentViewDelegate>

- (void)registerCellForTableView:(UITableView *)tableView;

@end
