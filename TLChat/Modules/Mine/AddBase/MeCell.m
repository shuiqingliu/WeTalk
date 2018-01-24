//
//  MeCell.m
//  TLChat
//
//  Created by 张总天 on 2017/12/10.
//  Copyright © 2017年 李伯坤. All rights reserved.
//

#import "MeCell.h"

@implementation MeCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self createUI];
    }
    return self;
}

- (void)createUI {
    self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    _avaterView = [UIImageView new];
    _avaterView.image = [UIImage imageNamed:@"default_avater"];
    [self.contentView addSubview:_avaterView];
    [_avaterView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.contentView);
        make.left.equalTo(self.contentView).offset(12);
        make.size.mas_equalTo(CGSizeMake(70, 70));
    }];
    
    _nameLabel = [UILabel new];
    _nameLabel.text = @"张无忌";
    _nameLabel.font = [UIFont systemFontOfSize:16];
    [self.contentView addSubview:_nameLabel];
    [_nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_avaterView.mas_right).offset(12);
        make.centerY.equalTo(self.contentView).offset(-10);
    }];
    
    _idLabel = [UILabel new];
    _idLabel.text = @"工号: 2017001";
    _idLabel.font = [UIFont systemFontOfSize:12];
    [self.contentView addSubview:_idLabel];
    [_idLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_avaterView.mas_right).offset(12);
        make.centerY.equalTo(self.contentView).offset(10);
    }];
    
    _positonLabel = [UILabel new];
    _positonLabel.text = @"职位: 部门总监";
    _positonLabel.font = [UIFont systemFontOfSize:12];
    [self.contentView addSubview:_positonLabel];
    [_positonLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_avaterView.mas_right).offset(12);
        make.centerY.equalTo(self.contentView).offset(30);
    }];
}


@end
