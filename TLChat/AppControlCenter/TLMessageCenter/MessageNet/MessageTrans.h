//
//  MessageTrans.h
//  SocketTest
//
//  Created by qingliu on 1/14/18.
//  Copyright © 2018 qingliu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TLMessage.h"
//设置代理协议，改变收到信息时的页面
@protocol receiveDelegate <NSObject>

//定义一个协议函数
-(void) receiveMessage:(TLMessage *)message;

@end

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

//定义一个代理对象
//代理对象会执行协议函数


@property(assign,nonatomic) id<receiveDelegate> delegate;

@end
