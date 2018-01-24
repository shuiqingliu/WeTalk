//
//  TLExpressionChosenViewController.h
//  TLChat
//
//  Created by iOS Team on 16/4/4.
//  Copyright © 2017年 iOS Team. All rights reserved.
//

#import "TLTableViewController.h"
#import "TLExpressionHelper.h"

@interface TLExpressionChosenViewController : TLTableViewController
{
    NSInteger kPageIndex;
}

@property (nonatomic, strong) NSMutableArray *data;

@property (nonatomic, strong) NSArray *bannerData;


@end
