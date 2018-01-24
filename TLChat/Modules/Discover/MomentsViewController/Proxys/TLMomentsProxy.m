//
//  TLMomentsProxy.m
//  TLChat
//
//  Created by libokun on 16/4/8.
//  Copyright © 2017年 iOS Team. All rights reserved.
//

#import "TLMomentsProxy.h"
#import "TLMoment.h"

@implementation TLMomentsProxy

- (NSArray *)testData
{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"Moments" ofType:@"json"];
    NSData *jsonData = [NSData dataWithContentsOfFile:path];
    NSArray *jsonArray = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingAllowFragments error:nil];
    NSArray *arr = [TLMoment mj_objectArrayWithKeyValuesArray:jsonArray];
    return arr;
}

@end
