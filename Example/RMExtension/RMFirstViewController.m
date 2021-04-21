//
//  RMFirstViewController.m
//  RMExtension_Example
//
//  Created by 张斌斌 on 2020/12/31.
//  Copyright © 2020 zhangbin. All rights reserved.
//

#import "RMFirstViewController.h"
#import <RMExtension/UIView+Extension.h>

@interface RMFirstViewController ()

@end

@implementation RMFirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.whiteColor;
        UIButton *redview = [[UIButton alloc]initWithFrame:CGRectMake(100, 100, 100, 100)];
        redview.backgroundColor = UIColor.blueColor;
//        [redview addTarget:self action:@selector(clickBtn) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:redview];
        redview.width = 200;
        redview.height = 200;
    [redview test];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
