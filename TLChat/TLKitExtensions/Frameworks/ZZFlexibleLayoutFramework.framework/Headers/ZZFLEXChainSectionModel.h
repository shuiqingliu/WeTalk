
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class ZZFlexibleLayoutSectionModel;
@interface ZZFLEXChainSectionModel : NSObject

/// 最小行间距
- (ZZFLEXChainSectionModel *(^)(CGFloat minimumLineSpacing))minimumLineSpacing;
/// 最小元素间距
- (ZZFLEXChainSectionModel *(^)(CGFloat minimumInteritemSpacing))minimumInteritemSpacing;
/// sectionInsets
- (ZZFLEXChainSectionModel *(^)(UIEdgeInsets sectionInsets))sectionInsets;
/// backgrounColor
- (ZZFLEXChainSectionModel *(^)(UIColor *backgrounColor))backgrounColor;

- (id)initWithSectionModel:(ZZFlexibleLayoutSectionModel *)sectionModel;

@end
