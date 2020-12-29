//
//  RMViewController.m
//  RMExtension
//
//  Created by zhangbin on 12/29/2020.
//  Copyright (c) 2020 zhangbin. All rights reserved.
//

#import "RMViewController.h"
#import <RMExtension/UIView+Extension.h>

@interface RMViewController ()

@end

@implementation RMViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    UIView *redview = [[UIView alloc]initWithFrame:CGRectMake(100, 100, 100, 100)];
    redview.backgroundColor = UIColor.blueColor;
    [self.view addSubview:redview];
    redview.width = 200;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
