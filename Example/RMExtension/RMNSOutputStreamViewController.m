//
//  RMNSOutputStreamViewController.m
//  RMExtension_Example
//
//  Created by 张斌斌 on 2021/1/4.
//  Copyright © 2021 zhangbin. All rights reserved.
//

#import "RMNSOutputStreamViewController.h"

@interface RMNSOutputStreamViewController ()<NSStreamDelegate>

@property (strong,nonatomic)NSData *myData;

@property (copy,nonatomic)NSString *writePath;

@property (strong,nonatomic)NSOutputStream *outputStream;

@property (nonatomic,assign)NSInteger readBytes;

@property (nonatomic,assign)NSInteger byteIndex;

@end

@implementation RMNSOutputStreamViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.whiteColor;
    //获取本地资源
    NSString *path = [[NSBundle mainBundle] pathForResource:@"nice.jpg" ofType:nil];
    self.myData = [NSData dataWithContentsOfFile:path];
    
    //获取一个写入文件的路径,写入沙盒
    _writePath = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES).firstObject;
    _writePath = [_writePath stringByAppendingPathComponent:@"nice.jpg"];
    
    NSLog(@"realPath:%@",_writePath);
    
    _outputStream = [[NSOutputStream alloc]initToFileAtPath:_writePath append:YES];
    
    [_outputStream scheduleInRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
    
    _outputStream.delegate = self;
    
    [_outputStream open];
}


- (void)stream:(NSStream *)aStream handleEvent:(NSStreamEvent)eventCode{
    switch (eventCode) {
        case NSStreamEventNone: {
            NSLog(@"NSStreamEventNone");
            break;
        }
        case NSStreamEventOpenCompleted: {
            NSLog(@"NSStreamEventOpenCompleted");
            break;
        }
        case NSStreamEventHasBytesAvailable:
        {
            NSLog(@"NSStreamEventHasBytesAvailable");
        }
            break;
        case NSStreamEventHasSpaceAvailable: {
            NSLog(@"NSStreamEventHasSpaceAvailable");
            self.readBytes += self.byteIndex;
            
            NSUInteger data_len = [self.myData length];
            NSUInteger len = (data_len - self.readBytes >=1024) ? 1024 : data_len - self.readBytes;
            
            uint8_t buff[len];
            
            [self.myData getBytes:buff range:NSMakeRange(self.readBytes, len)];
            
            len = [(NSOutputStream*)aStream write:buff maxLength:len];
            
            self.byteIndex = len;
            
            break;
        }
        case NSStreamEventErrorOccurred: {
            NSLog(@"NSStreamEventErrorOccurred");
            break;
        }
        case NSStreamEventEndEncountered: {
            NSLog(@"NSStreamEventEndEncountered");

            [aStream close];
            [aStream removeFromRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
            aStream = nil;
                        
            break;
        }
    }
}

- (void)dealloc{
    NSLog(@"RMNSOutputStreamViewController delloc");
}
@end
