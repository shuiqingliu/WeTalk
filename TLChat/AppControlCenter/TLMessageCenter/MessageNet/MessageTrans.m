//
//  MessageTrans.m
//  SocketTest
//
//  Created by qingliu on 1/14/18.
//  Copyright © 2018 qingliu. All rights reserved.
//

#import "MessageTrans.h"
#import <CoreFoundation/CFSocket.h>
#import <CocoaAsyncSocket/GCDAsyncSocket.h>
#import "TLMacros.h"
#import "TLUserHelper.h"

@interface MessageTrans()<GCDAsyncSocketDelegate>

@property (nonatomic,strong) GCDAsyncSocket *socket;

@end

static MessageTrans *messageTrans;
@implementation MessageTrans

+ (MessageTrans *)sharedInstance
{
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        messageTrans = [[MessageTrans alloc] init];
    });
    [messageTrans setChatContentSendMessage:^(NSString *message){
        NSLog(@"%@",message);
    }];
    return messageTrans;
}

- (void)createSocketConnect{
    NSString *host = SOCKET_IP;
    NSInteger port = SOCKET_PORT;
    NSError *error;
    if (!_socket.isConnected) {
        [self.socket connectToHost:host onPort:port error:&error];
    }
    if (error) {
        [self socketLogMessageWithString:[NSString stringWithFormat:@"连接失败: %@",error.localizedDescription]];
        return;
    }
    
}

- (void)closeConnect{
    if (_socket.isConnected) {
        [_socket disconnect];
    }
}
//Init Socket
- (GCDAsyncSocket *)socket{
    
    if (!_socket) {
        _socket = [[GCDAsyncSocket alloc] initWithDelegate:self delegateQueue:dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)];
    }
    
    return _socket;
}

//Socket delegate method
- (void)socket:(GCDAsyncSocket *)sock didConnectToHost:(NSString *)host port:(uint16_t)port{
    [self socketLogMessageWithString:[NSString stringWithFormat:@"连接成功: %@",host]];
    
    [self.socket readDataWithTimeout:-1 tag:0];
}


- (void)socketDidDisconnect:(GCDAsyncSocket *)sock withError:(NSError *)err{
    if (err) {
        [self socketLogMessageWithString:[NSString stringWithFormat:@"连接失败: %@",err.localizedDescription]];
    }else{
        [self socketLogMessageWithString:[NSString stringWithFormat:@"正常断开: %@",err.localizedDescription]];
    }
}

- (void)sendMessageWithString:(NSString *)message{
    [self.socket writeData:[message dataUsingEncoding:NSUTF8StringEncoding] withTimeout:-1 tag:0];
    NSString *sendMsg = [message stringByTrimmingCharactersInSet:[NSCharacterSet newlineCharacterSet]];
    NSString *sendMessage = [NSString stringWithFormat:@"发送给服务器的消息： %@",sendMsg];
    NSLog(@"%@",sendMessage);
    [self  socketLogMessageWithString:sendMessage];
}

- (void)socketLogMessageWithString:(NSString *)string {
    dispatch_async(dispatch_get_main_queue(), ^{
        if (self.chatContentSendMessage) {
            self.chatContentSendMessage(string);
        }
    });
}

// 发送数据后的回调方法
- (void)socket:(GCDAsyncSocket *)sock
didWriteDataWithTag:(long)tag {
    // 发送完数据手动读取，-1不设置超时
    NSString *userID = [[TLUserHelper sharedHelper]userID];
    [self.socket readDataWithTimeout:-1
                                 tag:0];
    NSLog(@"消息发送成功, 用户ID号为: %ld", tag);
}
// 读取数据
- (void)socket:(GCDAsyncSocket *)sock
   didReadData:(NSData *)data
       withTag:(long)tag {
    if (!data) {
        [self socketLogMessageWithString:@"并没有接收到服务器的消息"];
        return;
    }
    
    NSString *receiverStr = [[NSString alloc] initWithData:data
                                                  encoding:NSUTF8StringEncoding];
    
    NSLog(@"读取数据成功: %@", receiverStr);
    NSString *sendMessage = [NSString stringWithFormat:@"接收到的消息: %@", receiverStr];
    [self socketLogMessageWithString:sendMessage];

}


@end
