//
//  TLFriendCell.m
//  TLChat
//
//  Created by iOS Team on 16/1/26.
//  Copyright © 2017年 iOS Team. All rights reserved.
//

#import "TLFriendCell.h"
#import <UIImageView+WebCache.h>
#import "TLMacros.h"
#import "TLFriendSearchCell.h"
#import "TLFriendSearchViewController.h"

#define     FRIENDS_SPACE_X         10.0f
#define     FRIENDS_SPACE_Y         9.0f

#define     CONV_SPACE_X            10.0f
#define     CONV_SPACE_Y            9.5f


@interface TLFriendSearchCell ()

@property (nonatomic, strong) UIImageView *avatarImageView;

@property (nonatomic, strong) UILabel *usernameLabel;

@property (nonatomic, strong) UILabel *subTitleLabel;

@end

@implementation TLFriendSearchCell
  static NSString *dic;
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.leftSeparatorSpace = FRIENDS_SPACE_X;
        
        [self.contentView addSubview:self.avatarImageView];
        [self.contentView addSubview:self.usernameLabel];
        [self.contentView addSubview:self.subTitleLabel];
        
        [self p_addMasonry];
    }
    return self;
}

#pragma mark - Public Methods
- (void)setUser:(TLUser *)user
{
    _user = user;
    if (user.avatarPath) {
        [self.avatarImageView setImage:[UIImage imageNamed:user.avatarPath]];
    }
    else {
        [self.avatarImageView sd_setImageWithURL:TLURL(user.avatarURL) placeholderImage:[UIImage imageNamed:DEFAULT_AVATAR_PATH]];
    }
    
    [self.usernameLabel setText:user.showName];
   // [self.subTitleLabel setText:@"搜索到您与其有相关消息"];
    [self.subTitleLabel setText:dic];
    NSLog(@"setText里的dic%@",dic);
    if (user.detailInfo.remarkInfo.length > 0 && self.subTitleLabel.isHidden) {
        [self.subTitleLabel setHidden:NO];
        [self.usernameLabel mas_updateConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(self.avatarImageView).mas_offset(-5);
        }];
    }
    else if (user.detailInfo.remarkInfo.length == 0 && !self.subTitleLabel.isHidden){
        [self.usernameLabel mas_updateConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(self.avatarImageView);
        }];
    }
}

#pragma mark - Prvate Methods -
- (void)p_addMasonry
{
    [self.avatarImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(FRIENDS_SPACE_X);
        make.top.mas_equalTo(FRIENDS_SPACE_Y);
        make.bottom.mas_equalTo(- FRIENDS_SPACE_Y + 0.5);
        make.width.mas_equalTo(self.avatarImageView.mas_height);
    }];
    
    [self.usernameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.avatarImageView.mas_right).mas_offset(CONV_SPACE_X);
        make.top.mas_equalTo(-2);
        make.bottom.mas_equalTo(-20);
    }];
    
    [self.subTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.usernameLabel);
        make.top.mas_equalTo(self.usernameLabel.mas_bottom).mas_offset(-5);
        make.right.mas_lessThanOrEqualTo(self.contentView).mas_offset(-20);
    }];
}

#pragma mark - Getter
- (UIImageView *)avatarImageView
{
    if (_avatarImageView == nil) {
        _avatarImageView = [[UIImageView alloc] init];
    }
    return _avatarImageView;
}

- (UILabel *)usernameLabel
{
    if (_usernameLabel == nil) {
        _usernameLabel = [[UILabel alloc] init];
        [_usernameLabel setFont:[UIFont fontFriendsUsername]];
    }
    return _usernameLabel;
}

- (UILabel *)subTitleLabel
{
    if (_subTitleLabel == nil) {
        _subTitleLabel = [[UILabel alloc] init];
        [_subTitleLabel setFont:[UIFont systemFontOfSize:14.0f]];
        [_subTitleLabel setTextColor:[UIColor redColor]];
        [_subTitleLabel setHidden:NO];
    }
    return _subTitleLabel;
}
- (instancetype)initWithUserInfo:(NSString *)messageInfo {
    if (self = [super init]) {
        dic = messageInfo;
        NSLog(@"传过来的info值：%@", messageInfo);
        NSLog(@"dic的值：%@",dic);
        
    }
    return self;
}
@end
