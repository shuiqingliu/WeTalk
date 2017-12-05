#import "TLAppConfig.h"


@implementation TLAppConfig

+ (TLAppConfig *)sharedConfig
{
    static TLAppConfig *config;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        config = [[self alloc] init];
    });
    return config;
}


#pragma mark - # Getters
- (NSString *)version
{
    NSString *shortVersion = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];
    NSString *buildID = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"];
    NSString *version = [NSString stringWithFormat:@"%@ (%@)", shortVersion, buildID];

    return version;
}
@end
