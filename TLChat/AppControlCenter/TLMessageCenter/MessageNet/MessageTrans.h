//
//  MessageTrans.h
//  SocketTest
//
//  Created by qingliu on 1/14/18.
//  Copyright © 2018 qingliu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MessageTrans : NSObject

@property (nonatomic, copy) void(^chatContentSendMessage)(NSString *message);

+ (MessageTrans *)sharedInstance;

/**
 创建Socket连接
 */
- (void)createSocketConnect;

//断开连接
- (void)closeConnect;

/**
 发消息给服务端
 @param message NSString
 */
- (void)sendMessageWithString:(NSString *)message;

@end
