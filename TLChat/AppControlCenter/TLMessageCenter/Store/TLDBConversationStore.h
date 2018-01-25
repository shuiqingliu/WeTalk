//
//  TLDBConversationStore.h
//  TLChat
//
//  Created by iOS Team on 16/3/20.
//  Copyright © 2017年 iOS Team. All rights reserved.
//

#import "TLDBBaseStore.h"

@interface TLDBConversationStore : TLDBBaseStore

/**
 *  新的会话（未读）
 */
- (BOOL)addConversationByUid:(NSString *)uid fid:(NSString *)fid type:(NSInteger)type date:(NSDate *)date;

/**
 *  更新会话状态（已读）
 */
- (void)updateConversationByUid:(NSString *)uid fid:(NSString *)fid;

/**
 *  查询所有会话
 */
- (NSArray *)conversationsByUid:(NSString *)uid;

/**
 *  未读消息数
 */
- (NSInteger)unreadMessageByUid:(NSString *)uid fid:(NSString *)fid;

/**
 *  删除单条会话
 */
- (BOOL)deleteConversationByUid:(NSString *)uid fid:(NSString *)fid;

/**
 *  删除用户的所有会话
 */
- (BOOL)deleteConversationsByUid:(NSString *)uid;


@end