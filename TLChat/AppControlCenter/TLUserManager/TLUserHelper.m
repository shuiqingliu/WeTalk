//
//  TLUserHelper.m
//  TLChat
//
//  Created by iOS Team on 16/2/6.
//  Copyright © 2017年 iOS Team. All rights reserved.
//

#import "TLUserHelper.h"
#import "TLDBUserStore.h"

@implementation TLUserHelper
@synthesize user = _user;

+ (TLUserHelper *)sharedHelper
{
    static TLUserHelper *helper;
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        helper = [[TLUserHelper alloc] init];
    });
    return helper;
}

- (void)loginTestAccount
{
    TLUser *user = [[TLUser alloc] init];
    user.userID = @"u1002";
    user.avatarURL = @"http://p1.qq181.com/cms/120506/2012050623111097826.jpg";
    user.nikeName = @"iOS Team";
    user.username = @"zhang-zt";
    user.detailInfo.qqNumber = @"1234567890";
    user.detailInfo.email = @"zhangzt@bupt.edu.cn";
    user.detailInfo.location = @"北京 海淀";
    user.detailInfo.sex = @"男";
    user.detailInfo.motto = @"Hello world!";
    user.detailInfo.momentsWallURL = @"http://img06.tooopen.com/images/20160913/tooopen_sy_178786212749.jpg";

    [self setUser:user];
}

- (void)setUser:(TLUser *)user
{
    _user = user;
    TLDBUserStore *userStore = [[TLDBUserStore alloc] init];
    if (![userStore updateUser:user]) {
        DDLogError(@"登录数据存库失败");
    }

    [[NSUserDefaults standardUserDefaults] setObject:user.userID forKey:@"loginUid"];
}
- (TLUser *)user
{
    if (!_user) {
        if (self.userID.length > 0) {
            TLDBUserStore *userStore = [[TLDBUserStore alloc] init];
            _user = [userStore userByID:self.userID];
            if (!_user) {
                [[NSUserDefaults standardUserDefaults] setObject:@"" forKey:@"loginUid"];
            }
        }
    }
    return _user;
}

- (NSString *)userID
{
    NSString *uid = [[NSUserDefaults standardUserDefaults] objectForKey:@"loginUid"];
    return uid;
}

- (BOOL)isLogin
{
    return self.user.userID.length > 0;
}

@end
