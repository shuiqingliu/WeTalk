//
//  MessageTrans.m
//  SocketTest
//
//  Created by qingliu on 1/14/18.
//  Copyright © 2018 qingliu. All rights reserved.
//

#import "MessageKit.h"
#import "MessageTrans.h"
#import <CoreFoundation/CFSocket.h>
#import <CocoaAsyncSocket/GCDAsyncSocket.h>
#import "TLMacros.h"
#import "TLUserHelper.h"
#import "TLConversationViewController+Delegate.h"
#import "TLConversation+TLUser.h"
#import "TLConversationCell.h"
#import "TLFriendHelper.h"
#import "TLLaunchManager.h"

#import "TLChatBaseViewController+ChatBar.h"
#import "TLChatBaseViewController+Proxy.h"
#import "TLChatBaseViewController+MessageDisplayView.h"
#import "TLGroup+CreateAvatar.h"

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
- (void)socket:(GCDAsyncSocket *)sock didReadData:(NSData *)data
       withTag:(long)tag {
    if (!data) {
        [self socketLogMessageWithString:@"并没有接收到服务器的消息"];
        return;
    }
   //[self.socket readDataWithTimeout:-1 tag:0];
    
    NSString *receiverStr = [[NSString alloc] initWithData:data
                                                  encoding:NSUTF8StringEncoding];
    NSLog(@"读取数据成功: %@", receiverStr);
    NSString *sendMessage = [NSString stringWithFormat:@"接收到的消息: %@", receiverStr];

    //解析json字符串，暂时这么写wky
    //此处‘,’分隔符危险，当内容中含有‘,’就GG

    NSArray *array = [receiverStr componentsSeparatedByString:@","]; //从字符,中分隔成2个元素的数组
    NSLog(@"array:%@",array[3]); //

    NSArray *array1 = [array[3] componentsSeparatedByString:@":"]; //从字符:中分隔成2个元素的数组
    NSLog(@"array1:%@",array1[1]); //
    
    NSArray *array2 = [array1[1] componentsSeparatedByString:@"\""]; //从字符"中分隔成2个元素的数组
    NSLog(@"array2:%@",array2[1]); //
  
    NSString *content = array2[1];
    
    //获取消息类型：msg  or msgGroup
    NSArray *type =[array[0] componentsSeparatedByString:@":"];
    NSLog(@"type: %@",type[1]);
    
    //获取消息来源：from
    NSArray * from = [array[1] componentsSeparatedByString:@":"];
    NSArray * fromWithout = [from[1] componentsSeparatedByString:@"\""]; //去除掉""
    NSLog(@"from:%@",fromWithout[1]);
    
    TLTextMessage *message1 = [[TLTextMessage alloc] init];
    NSString *partnerID = fromWithout[1];//取得消息来自于谁
    TLUser *user = [[TLFriendHelper sharedFriendHelper] getFriendInfoByUserID:partnerID];
     message1.fromUser = user;
    message1.friendID = partnerID;
     message1.text=content;
    message1.userID =partnerID;
     
    //just for test for store to DB -->conv
    if( [type[1] isEqualToString:@"\"msg\""]){
        NSLog(@"single");
        dispatch_async(dispatch_get_main_queue(), ^{
            if(_delegate){
                NSLog(@"此时恰好在聊天界面中");
                [_delegate receiveMessage:message1];
            }else{
                NSLog(@"代理不存在，即不在当前的聊天界面当中。");
                TLChatBaseViewController *chatVC = [[TLChatBaseViewController alloc]init];
                TLUser *user = [[TLFriendHelper sharedFriendHelper] getFriendInfoByUserID:partnerID];
                
                if (user == nil) {
                    [TLUIUtility showAlertWithTitle:@"错误" message:@"出错了"];
                    return;
                }
                [chatVC setPartner:user];
//                NSString* chat_par  = [chatVC partnerID];
                
                UIViewController *vc = [[TLLaunchManager sharedInstance].rootVC childViewControllerAtIndex:0];
                [[TLLaunchManager sharedInstance].rootVC setSelectedIndex:1];//这个1是我改的。
                [vc setHidesBottomBarWhenPushed:YES];
                [vc.navigationController pushViewController:chatVC animated:NO];
                [vc setHidesBottomBarWhenPushed:NO];
                [chatVC receivedMessage:message1];
                [chatVC.navigationController popToRootViewControllerAnimated:NO];
                
            }
            
            
        });
    }else if([type[1] isEqualToString: @"\"msgGroup\""]){
        NSLog(@"群聊");
//        获取群聊内容，乱搞
        NSArray *msgContent = [receiverStr componentsSeparatedByString:@"messageContent:"];
        NSArray* msg=[msgContent[1] componentsSeparatedByString:@"}"];
        NSLog(@"msg: %@",msg[0]);//msg[0] 即群聊的内容

        //获取群号码
        NSArray *groupNum = [receiverStr componentsSeparatedByString:@"groupID:"];
        NSArray * gNum = [groupNum[1] componentsSeparatedByString:@","];
        NSLog(@"群号码是：%@",gNum[0]);


        //获取群成员列表 + 上文fromWithout[1]
        NSArray* left= [receiverStr componentsSeparatedByString:@"["];
        NSArray* right = [left[1] componentsSeparatedByString:@"]"];
        NSArray* mebs = [right[0] componentsSeparatedByString:@","];
        for(NSString* m in mebs){
            NSLog(@"%@",m); //m是群成员列表当中的字符串
        }

        NSString *partnerID = gNum[0];//群号
        NSString *content = [NSString stringWithFormat:@"%@",msg[0]];
        //群成员
        //TLUser *user = (id<TLChatUserProtocol>)[TLUserHelper sharedHelper].user;

        NSMutableArray* groupMeb = [[NSMutableArray alloc]init];//群成员，目前为空，没人，应该服务端转发过来
        for(NSString* m in mebs){
            TLUser *user1 =[[TLFriendHelper sharedFriendHelper] getFriendInfoByUserID:m];
            [groupMeb addObject:user1];

        }
        [groupMeb addObject:user];



        TLGroup *group = [[TLFriendHelper sharedFriendHelper] getGroupInfoByGroupID:partnerID];
        TLDBGroupStore* groupStore = [[TLDBGroupStore alloc]init];
        if (group == nil) {
            //直接建群
            NSLog(@"群是空的，我现在要开始新建一个群");
            TLGroup* group = [[TLGroup alloc]init];
            [group setGroupID:partnerID];
            [group setUsers:groupMeb];
            [group setGroupName:@"群聊"];//消息中未携带，写死
            BOOL ok = [groupStore addGroup:group forUid:[TLUserHelper sharedHelper].userID];
            if (!ok) {
                DDLogError(@"保存群数据到数据库失败!QWQ");
            }
            [group createGroupAvatarWithCompleteAction:nil];
        }
        TLTextMessage *message2 = [[TLTextMessage alloc] init];
        message2.fromUser =(id<TLChatUserProtocol>) user;//
        //            message2.partnerType = message.partnerType;
        message2.friendID = [user chat_userID];
        //message1.userID = user.userID;
        //message1.groupID = group.groupID;
        message2.text=content;
        NSLog(@"debug2");

        //群聊暂时这么写
        dispatch_async(dispatch_get_main_queue(), ^{
            
                TLChatBaseViewController* chatVC = [[TLChatBaseViewController alloc]init];
                [chatVC setPartner:group];
                UIViewController *vc = [[TLLaunchManager sharedInstance].rootVC childViewControllerAtIndex:0];
                [[TLLaunchManager sharedInstance].rootVC setSelectedIndex:1];
                [vc setHidesBottomBarWhenPushed:YES];
                [vc.navigationController pushViewController:chatVC animated:NO];
                [vc setHidesBottomBarWhenPushed:NO];
                [chatVC receivedMessage:message2];
                [vc.navigationController popViewControllerAnimated:NO];
        
        });
    }
    
    [self.socket readDataWithTimeout:-1 tag:0];

}


@end
