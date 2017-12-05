
#import <Foundation/Foundation.h>

@interface TLRootProxy : NSObject

- (void)requestClientInitInfoSuccess:(void (^)(id))clientInitInfo
                             failure:(void (^)(NSString *))error;

- (void)userLoginWithPhoneNumber:(NSString *)phoneNumber
                        password:(NSString *)password
                         success:(TLBlockRequestSuccessWithDatas)success
                         failure:(TLBlockRequestFailureWithErrorMessage)failure;


- (void)userRegisterWithPhoneNumber:(NSString *)phoneNumber
                           password:(NSString *)password
                            success:(TLBlockRequestSuccessWithDatas)success
                            failure:(TLBlockRequestFailureWithErrorMessage)failure;

@end
