//
//  MessageKit.m
//  TLChat
//
//  Created by qingliu on 1/25/18.
//  Copyright © 2018 李伯坤. All rights reserved.
//

#import "MessageKit.h"

@implementation MessageKit

- (id)initWithParament:(NSString *)msgType from:(NSString *)fromID to:(NSString *)toID content:(NSString *)msgContent{
    [self setType:msgType];
    [self setFrom:fromID];
    [self setTo:toID];
    [self setContent:msgContent];
    [self setTime:[self formatDate]];
    return self;
}

- (NSString*)getJsonData{
    NSString *messageJsonData = [NSString stringWithFormat:@"{\"type\":\"%@\",\"from\":\"%@\",\"to\":\"%@\",\"content\":\"%@\",\"time\":\"%@\"}",[self type],[self from],[self to],[self content],[self time]];
    NSString *msgJson = [messageJsonData stringByAppendingString:@"\n"];
    NSLog(@"============\n%@\n=============",msgJson);
    return msgJson;
}

- (NSString*)getMessageKit:(NSString *)receivedMsg{
    //TODO  read json data
    return @"";
}

- (NSString*)formatDate{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = @"yyyy-MM-dd HH:mm:ss";
    NSString *dateString = [dateFormatter stringFromDate:[NSDate date]];
    return dateString;
}
@end
