//
//  RMViewController.m
//  RMExtension
//
//  Created by zhangbin on 12/29/2020.
//  Copyright (c) 2020 zhangbin. All rights reserved.
//

#import "RMViewController.h"
#import <RMExtension/UIView+Extension.h>
#import "RMSecondViewController.h"

@interface RMViewController ()

@end

@implementation RMViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    UIButton *redview = [[UIButton alloc]initWithFrame:CGRectMake(100, 100, 100, 100)];
    redview.backgroundColor = UIColor.blueColor;
    [redview addTarget:self action:@selector(clickBtn) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:redview];
    redview.width = 200;
    redview.height = 200;
}


- (void)clickBtn{
    RMSecondViewController *viewController = [RMSecondViewController new];
    [self presentViewController:viewController animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
