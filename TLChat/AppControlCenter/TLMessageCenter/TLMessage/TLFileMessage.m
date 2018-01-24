//
//  TLFileMessage.m
//  TLChat
//
//  Created by qingliu on 12/24/17.
//  Copyright © 2017 李伯坤. All rights reserved.
//

#import "TLFileMessage.h"

@implementation TLFileMessage

@synthesize fileName = _fileName;
@synthesize fileSize = _fileSize;

- (id)init
{
    if (self = [super init]) {
        [self setMessageType:TLMessageTypeFile];
    }
    return self;
}

#pragma mark -
- (NSString *)fileName
{
    if (_fileName == nil) {
        _fileName = [self.content objectForKey:@"fileName"];
    }
    return _fileName;
}
- (void)setFileName:(NSString *)fileName
{
    _fileName = fileName;
    [self.content setObject:fileName forKey:@"fileName"];
}

- (NSString *)fileSize
{
    if (_fileSize == nil) {
        _fileSize = [self.content objectForKey:@"size"];
    }
    return _fileSize;
}
- (void)setFileSize:(NSString *)fileSize
{
    _fileSize = fileSize;
    [self.content setObject:fileSize forKey:@"size"];
}

- (CGSize)imageSize
{
    CGFloat width = [[self.content objectForKey:@"w"] doubleValue];
    CGFloat height = [[self.content objectForKey:@"h"] doubleValue];
    return CGSizeMake(width, height);
}
- (void)setImageSize:(CGSize)imageSize
{
    [self.content setObject:[NSNumber numberWithDouble:imageSize.width] forKey:@"w"];
    [self.content setObject:[NSNumber numberWithDouble:imageSize.height] forKey:@"h"];
}

#pragma mark -
- (TLMessageFrame *)messageFrame
{
    if (kMessageFrame == nil) {
        kMessageFrame = [[TLMessageFrame alloc] init];
        kMessageFrame.height = 20 + (self.showTime ? 30 : 0) + (self.showName ? 15 : 0);
        
        kMessageFrame.contentSize = CGSizeMake(100, 20);
        kMessageFrame.height += kMessageFrame.contentSize.height;
    }
    return kMessageFrame;
}

- (NSString *)conversationContent
{
    return @"[File]";
}

- (NSString *)messageCopy
{
    return [self.content mj_JSONString];
}

@end
