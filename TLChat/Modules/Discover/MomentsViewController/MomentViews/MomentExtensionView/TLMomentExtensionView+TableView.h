//
//  TLMomentExtensionView+TableView.h
//  TLChat
//
//  Created by iOS Team on 16/4/8.
//  Copyright © 2017年 iOS Team. All rights reserved.
//

#import "TLMomentExtensionView.h"

@interface TLMomentExtensionView (TableView) <UITableViewDelegate, UITableViewDataSource>

- (void)registerCellForTableView:(UITableView *)tableView;

@end
