//
//  TLSettingGroup.m
//  TLChat
//
//  Created by iOS Team on 16/2/7.
//  Copyright © 2017年 iOS Team. All rights reserved.
//

#import "TLSettingGroup.h"

@implementation TLSettingGroup

+ (TLSettingGroup *) createGroupWithHeaderTitle:(NSString *)headerTitle
                                    footerTitle:(NSString *)footerTitle
                                          items:(NSMutableArray *)items
{
    TLSettingGroup *group= [[TLSettingGroup alloc] init];
    group.headerTitle = headerTitle;
    group.footerTitle = footerTitle;
    group.items = items;
    return group;
}

#pragma mark - Public Mthods
- (id)objectAtIndex:(NSUInteger)index
{
    return [self.items objectAtIndex:index];
}

- (NSUInteger)indexOfObject:(id)obj
{
    return [self.items indexOfObject:obj];
}


- (void)removeObject:(id)obj
{
    [self.items removeObject:obj];
}

#pragma mark - Setter
- (void)setHeaderTitle:(NSString *)headerTitle
{
    _headerTitle = headerTitle;
    _headerHeight = [headerTitle tt_sizeWithFont:[UIFont fontSettingHeaderAndFooterTitle] constrainedToWidth:SCREEN_WIDTH - 30].height;
}

- (void)setFooterTitle:(NSString *)footerTitle
{
    _footerTitle = footerTitle;
    _footerHeight = [footerTitle tt_sizeWithFont:[UIFont fontSettingHeaderAndFooterTitle] constrainedToWidth:SCREEN_WIDTH - 30].height;
}

#pragma mark - Getter
- (NSUInteger) count
{
    return self.items.count;
}

@end
