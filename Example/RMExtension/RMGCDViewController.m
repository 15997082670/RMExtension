//
//  RMGCDViewController.m
//  RMExtension_Example
//
//  Created by 张斌斌 on 2021/1/3.
//  Copyright © 2021 zhangbin. All rights reserved.
//

#import "RMGCDViewController.h"

@interface RMGCDViewController ()

@end

@implementation RMGCDViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.whiteColor;
    
    dispatch_group_t group = dispatch_group_create();
    NSLog(@"------0");

    
//    dispatch_group_async(group, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
//        NSLog(@"------0");
//    });
    
    dispatch_group_enter(group);
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        sleep(3);
        NSLog(@"------1");
        dispatch_group_leave(group);
    });
    
    dispatch_group_enter(group);
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        sleep(6);
        NSLog(@"------2");
        dispatch_group_leave(group);
    });
    
    
    dispatch_group_notify(group, dispatch_get_main_queue(), ^{
        NSLog(@"------3");
    });
}


@end
