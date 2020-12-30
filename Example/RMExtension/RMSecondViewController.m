//
//  RMSecondViewController.m
//  RMExtension_Example
//
//  Created by 张斌斌 on 2020/12/30.
//  Copyright © 2020 zhangbin. All rights reserved.
//

#import "RMSecondViewController.h"
#import <RMExtension/RMWeakTimerTarget.h>

@interface RMSecondViewController ()

@property (strong,nonatomic)NSTimer *timer;

@end

@implementation RMSecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.redColor;
    
    [RMWeakTimerTarget scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(dismissPage) userInfo:nil repeats:YES];
//    self.timer = [NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(dismissPage) userInfo:nil repeats:YES];
    
    // Do any additional setup after loading the view.
}


- (void)dismissPage{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)dealloc{
    NSLog(@"%@-%s",[self class],__func__);
}

@end
