//
//  RMStremViewController.m
//  RMExtension_Example
//
//  Created by 张斌斌 on 2021/1/4.
//  Copyright © 2021 zhangbin. All rights reserved.
//

#import "RMStremViewController.h"

@interface RMStremViewController ()<NSStreamDelegate>
@property (strong,nonatomic)UIImageView *imageView;
@property (strong,nonatomic)NSMutableData *data;
@end

@implementation RMStremViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.whiteColor;
    _imageView = [UIImageView new];
    _imageView.frame = CGRectMake(100, 100, 200, 100);
    [self.view addSubview:_imageView];
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"nice.jpg" ofType:nil];
    
    NSInputStream *strem = [[NSInputStream alloc]initWithFileAtPath:path];
    strem.delegate = self;
    [strem scheduleInRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
    [strem open];
    
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

            if (!_data) {
                _data = [NSMutableData data];
            }
            
            uint8_t buf[1024];
            NSInteger len = 0;
            len = [(NSInputStream *)aStream read:buf maxLength:1024];  // 读取数据
            if (len) {
                [_data appendBytes:(const void *)buf length:len];
            }
        }
            break;
        case NSStreamEventHasSpaceAvailable: {
            NSLog(@"NSStreamEventHasSpaceAvailable");
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
            
            self.imageView.image = [UIImage imageWithData:self.data];
            
            break;
        }
    }
}
@end
