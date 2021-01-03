//
//  RMCATransitionViewController.m
//  RMExtension_Example
//
//  Created by 张斌斌 on 2020/12/31.
//  Copyright © 2020 zhangbin. All rights reserved.
//

#import "RMCATransitionViewController.h"

@interface RMCATransitionViewController ()

@property (strong,nonatomic)CALayer *testLayer;

@property (strong,nonatomic)UIButton *startBtn;

@end

@implementation RMCATransitionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.whiteColor;
    
    _testLayer = [[CALayer alloc]init];
    _testLayer.frame = CGRectMake(100, 100, 100, 100);
    _testLayer.backgroundColor = UIColor.redColor.CGColor;
    [self.view.layer addSublayer:_testLayer];
    
    
    _startBtn = [UIButton new];
    [_startBtn addTarget:self action:@selector(clickStartBtn) forControlEvents:UIControlEventTouchUpInside];
    _startBtn.frame = CGRectMake(10, 300, 120, 40);
    _startBtn.backgroundColor = UIColor.orangeColor;
    [self.view addSubview:_startBtn];
}

- (void)clickStartBtn{
    [CATransaction begin];
    [CATransaction setAnimationDuration:2.0];
    [CATransaction setCompletionBlock:^{
        NSLog(@"complete");
        _testLayer.backgroundColor = UIColor.purpleColor.CGColor;
    }];
    _testLayer.backgroundColor = UIColor.blackColor.CGColor;
    
    [CATransaction begin];
    _testLayer.cornerRadius = 18.0;
    [CATransaction commit];
    
    [CATransaction commit];
}

@end
