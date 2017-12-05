#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, ZZFLEXChainViewType) {
    ZZFLEXChainViewTypeCell,
    ZZFLEXChainViewTypeHeader,
    ZZFLEXChainViewTypeFooter,
};

@class ZZFlexibleLayoutViewModel;
@interface ZZFLEXChainViewModel : NSObject

@property (nonatomic, assign, readonly) ZZFLEXChainViewType type;

- (ZZFLEXChainViewModel *(^)(NSInteger section))toSection;
- (ZZFLEXChainViewModel *(^)(id dataModel))withDataModel;
- (ZZFLEXChainViewModel *(^)(id ((^)(NSInteger actionType, id data))))eventAction;
- (ZZFLEXChainViewModel *(^)(NSInteger viewTag))viewTag;

- (id)initWithListData:(NSMutableArray *)listData viewModel:(ZZFlexibleLayoutViewModel *)viewModel andType:(ZZFLEXChainViewType)type;

@end

