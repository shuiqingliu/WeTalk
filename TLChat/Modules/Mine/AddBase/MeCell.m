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
    //**************************************
    NSString *path = [[NSBundle mainBundle]pathForResource:@"MyInfo.json" ofType:nil];
    NSData *data = [NSData dataWithContentsOfFile:path];
    NSDictionary *arr = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];

    

    NSString *nickname = [arr objectForKey:@"nikeName"];

    
    NSString *phoneNum = [arr objectForKey:@"phoneNumber"];
    NSString *email = [arr objectForKey:@"email"];
    NSString *userID = [arr objectForKey:@"userID"];
    NSString *avatarURL = [arr objectForKey:@"avatarURL"];
    NSLog(@"!!!!%@",phoneNum);
    NSLog(@"!!!!%@",email);
    NSLog(@"!!!!%@",userID);
    NSLog(@"!!!!%@",nickname);
    NSLog(@"!!!!%@",avatarURL);
    
    
    //}

    
    
    
    //**************************************
    _avaterView = [UIImageView new];
    NSURL *avatarUrl = [NSURL URLWithString:avatarURL];
    _avaterView.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:avatarUrl]];
    [self.contentView addSubview:_avaterView];
    [_avaterView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.contentView);
        make.left.equalTo(self.contentView).offset(12);
        make.size.mas_equalTo(CGSizeMake(70, 70));
    }];
    
    _nameLabel = [UILabel new];
    _nameLabel.text = nickname;
    _nameLabel.font = [UIFont systemFontOfSize:16];
    [self.contentView addSubview:_nameLabel];
    [_nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_avaterView.mas_right).offset(12);
        make.centerY.equalTo(self.contentView).offset(-10);
    }];
    
    _idLabel = [UILabel new];
    _idLabel.text = userID;
    NSString *myID = [@"工号：" stringByAppendingString:userID];
    _idLabel.text = myID;
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
    
    _phoneLabel = [UILabel new];
     NSString *phoneNumTx = [@"电话：" stringByAppendingString:phoneNum];
    _phoneLabel.text = phoneNumTx;
    _phoneLabel.font = [UIFont systemFontOfSize:12];
    [self.contentView addSubview:_phoneLabel];
    [_phoneLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_avaterView.mas_right).offset(120);
        make.centerY.equalTo(self.contentView).offset(10);
    }];
    
    _mailLabel = [UILabel new];
    NSString *mail = [@"邮箱：" stringByAppendingString:email];
    _mailLabel.text = mail;
    _mailLabel.font = [UIFont systemFontOfSize:12];
    [self.contentView addSubview:_mailLabel];
    [_mailLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_avaterView.mas_right).offset(120);
        make.centerY.equalTo(self.contentView).offset(30);
    }];
}


@end
