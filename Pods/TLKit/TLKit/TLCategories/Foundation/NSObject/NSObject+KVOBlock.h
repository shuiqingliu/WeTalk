//
//  NSObject+KVOBlock.h
//  TLKit
//
//  Created by iOS Team on 2017/9/11.
//  Copyright © 2017年 iOS Team. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^TLKVOBlock)(NSDictionary *change, void *context);

@interface NSObject (KVOBlock)

- (void)tt_addObserver:(NSObject *)observer
            forKeyPath:(NSString *)keyPath
               options:(NSKeyValueObservingOptions)options
               context:(void *)context
             withBlock:(TLKVOBlock)block;

-(void)tt_removeBlockObserver:(NSObject *)observer
                   forKeyPath:(NSString *)keyPath;

-(void)tt_addObserverForKeyPath:(NSString *)keyPath
                        options:(NSKeyValueObservingOptions)options
                        context:(void *)context
                      withBlock:(TLKVOBlock)block;

-(void)tt_removeBlockObserverForKeyPath:(NSString *)keyPath;


@end
