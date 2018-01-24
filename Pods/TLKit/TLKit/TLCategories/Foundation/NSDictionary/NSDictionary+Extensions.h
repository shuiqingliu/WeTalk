//
//  NSDictionary+Extensions.h
//  TLKit
//
//  Created by iOS Team on 2017/9/11.
//  Copyright © 2017年 iOS Team. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (Extensions)

+ (NSDictionary *)dictionaryMergeWith:(NSDictionary *)dict1 and:(NSDictionary *)dict2;

- (NSDictionary *)dictionaryMergeWith:(NSDictionary *)dictionary;

@end
