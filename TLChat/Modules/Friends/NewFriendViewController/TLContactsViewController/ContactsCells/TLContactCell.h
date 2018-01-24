//
//  TLContactCell.h
//  TLChat
//
//  Created by iOS Team on 16/3/8.
//  Copyright © 2017年 iOS Team. All rights reserved.
//

#import "TLTableViewCell.h"
#import "TLContact.h"

/**
 *  通讯录 Cell
 */

@interface TLContactCell : TLTableViewCell

@property (nonatomic, strong) TLContact *contact;

@end
