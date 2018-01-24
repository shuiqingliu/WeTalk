//
//  ChatViewController.h
//  TLChat
//
//  Created by qingliu on 12/5/17.
//  Copyright © 2017 李伯坤. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TLTableViewController.h"

@class TLChatBar;
@protocol FileSendDelegate
- (void)sendFile:(NSString *)fileName;

@end

@interface FileViewController : TLTableViewController{
    id<FileSendDelegate> delegate;
}

@property (nonatomic,copy) NSString *chatName;
@property (strong,nonatomic)UITableView *tableview;
@property (strong,nonatomic)NSArray *array;
@property (strong,nonatomic)NSArray *arrayImage;
@property (strong,nonatomic)UILabel *fileTitle;

@property (assign,nonatomic)id<FileSendDelegate> delegate;

@end
