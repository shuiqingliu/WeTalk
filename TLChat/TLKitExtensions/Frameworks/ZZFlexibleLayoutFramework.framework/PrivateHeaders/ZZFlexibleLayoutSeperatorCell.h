#import <UIKit/UIKit.h>
#import "ZZFlexibleLayoutViewProtocol.h"

#pragma mark - # ZZFlexibleLayoutSeperatorModel
@interface ZZFlexibleLayoutSeperatorModel : NSObject

@property (nonatomic, assign) CGSize size;

@property (nonatomic, strong) UIColor *color;

- (id)initWithSize:(CGSize)size andColor:(UIColor *)color;

@end


#pragma mark - # ZZFlexibleLayoutSeperatorCell
@interface ZZFlexibleLayoutSeperatorCell : UICollectionViewCell <ZZFlexibleLayoutViewProtocol>

@property (nonatomic, strong) ZZFlexibleLayoutSeperatorModel *model;

@end
