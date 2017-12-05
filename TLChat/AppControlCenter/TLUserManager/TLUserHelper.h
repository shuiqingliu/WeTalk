#import <Foundation/Foundation.h>
#import "TLUser.h"

@interface TLUserHelper : NSObject

@property (nonatomic, strong) TLUser *user;

@property (nonatomic, strong, readonly) NSString *userID;

@property (nonatomic, assign, readonly) BOOL isLogin;

+ (TLUserHelper *)sharedHelper;

- (void)loginTestAccount;

@end
