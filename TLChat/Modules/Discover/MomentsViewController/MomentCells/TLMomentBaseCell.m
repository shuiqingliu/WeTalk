//
//  TLMomentBaseCell.m
//  TLChat
//
//  Created by libokun on 16/4/7.
//  Copyright © 2017年 iOS Team. All rights reserved.
//

#import "TLMomentBaseCell.h"

@implementation TLMomentBaseCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setBottomLineStyle:TLCellLineStyleFill];
        [self setSelectionStyle:UITableViewCellSelectionStyleNone];
    }
    return self;
}

@end
