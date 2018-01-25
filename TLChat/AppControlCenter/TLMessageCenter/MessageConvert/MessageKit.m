//
//  MessageKit.m
//  TLChat
//
//  Created by qingliu on 1/25/18.
//  Copyright © 2018 李伯坤. All rights reserved.
//

#import "MessageKit.h"

@implementation MessageKit

- (NSString*)getJsonData{
    NSString *messageJsonData = [NSString stringWithFormat:@"{type:%@,from:%@,to:%@,content:%@,time:%@}",[self type],[self from],[self to],[self content],[self time]];
    NSString *msgJson = [messageJsonData stringByAppendingString:@"\n"];
    NSLog(@"============\n%@\n=============",msgJson);
    return msgJson;
}

- (NSString*)getMessageKit:(NSString *)receivedMsg{
    //TODO  read json data
    return @"";
}

@end
