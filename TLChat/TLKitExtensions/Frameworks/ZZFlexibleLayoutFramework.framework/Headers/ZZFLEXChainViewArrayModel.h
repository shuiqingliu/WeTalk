
#import <Foundation/Foundation.h>

@interface ZZFLEXChainViewArrayModel : NSObject

- (ZZFLEXChainViewArrayModel *(^)(NSInteger section))toSection;
- (ZZFLEXChainViewArrayModel *(^)(NSArray *dataModelArray))withDataModelArray;
- (ZZFLEXChainViewArrayModel *(^)(id ((^)(NSInteger actionType, id data))))eventAction;
- (ZZFLEXChainViewArrayModel *(^)(NSInteger viewTag))viewTag;

- (id)initWithClassName:(NSString *)className listData:(NSMutableArray *)listData;

@end
