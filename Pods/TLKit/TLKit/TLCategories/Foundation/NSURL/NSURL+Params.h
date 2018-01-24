//
//  NSURL+Params.h
//  TLKit
//
//  Created by iOS Team on 2017/9/11.
//  Copyright © 2017年 iOS Team. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSURL (Params)

/**
 *  url参数转字典
 */
- (NSDictionary *)parameters;

/**
 *  根据参数名 取参数值
 */
- (NSString *)valueForParameter:(NSString *)parameterKey;

@end
