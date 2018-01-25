//
//  MessageKit.h
//  TLChat
//
//  Created by qingliu on 1/25/18.
//  Copyright © 2018 李伯坤. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MessageKit : NSObject

@property (nonatomic,strong) NSString *type;
@property (nonatomic,strong) NSString *from;
@property (nonatomic,strong) NSString *to;
@property (nonatomic,strong) NSString *content;
@property (nonatomic,strong) NSDate   *time;

- (NSString*)getJsonData;

- (NSString*)getMessageKit:(NSString*)receivedMsg;

@end
