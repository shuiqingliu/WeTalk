//
//  MeCell.h
//  TLChat
//
//  Created by 张总天 on 2017/12/10.
//  Copyright © 2017年 李伯坤. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MeCell : UITableViewCell

@property (nonatomic, strong) UIImageView * avaterView;

@property (nonatomic, strong) UILabel * nameLabel;

@property (nonatomic, strong) UILabel * idLabel;

@property (nonatomic,strong) UILabel * positonLabel;
@property (nonatomic,strong) UILabel *phoneLabel;
@property (nonatomic,strong) UILabel *mailLabel;
@end
