//
//  TLChatGroupDetailViewController.h
//  TLChat
//
//  Created by iOS Team on 16/3/8.
//  Copyright © 2017年 iOS Team. All rights reserved.
//

#import "TLSettingViewController.h"
#import "TLGroup.h"
#import "reselectMebViewController.h"
#import "TLDBGroupStore.h"


@interface TLChatGroupDetailViewController : TLSettingViewController<reselectMebDelegate>

-(void) addGroupMeb:(NSArray *)reselectedUsers;

@property (nonatomic, strong) TLGroup *group;


//
@property (nonatomic, strong) UILabel *footerLabel;

@property (nonatomic, strong) TLFriendHelper *friendHelper;

@property (nonatomic, strong) TLDBGroupStore *groupStore;
//

@end
