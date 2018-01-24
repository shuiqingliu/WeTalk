//
//  TLMineHeaderCell.h
//  TLChat
//
//  Created by iOS Team on 16/2/6.
//  Copyright © 2017年 iOS Team. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TLUser.h"

@interface TLMineHeaderCell : UICollectionViewCell <ZZFlexibleLayoutViewProtocol>

@property (nonatomic, strong) TLUser *user;

@end
