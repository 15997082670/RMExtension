//
//  RMNSHashTableViewController.m
//  RMExtension_Example
//
//  Created by 张斌斌 on 2021/1/9.
//  Copyright © 2021 zhangbin. All rights reserved.
//

#import "RMNSHashTableViewController.h"
#import "RMNSOutputStreamViewController.h"

@interface RMNSHashTableViewController ()

@property (strong,nonatomic)NSHashTable *hashTable;


@property (strong,nonatomic)NSMutableArray *dataSource;


@end

@implementation RMNSHashTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.rightBarButtonItem =  [[UIBarButtonItem alloc]initWithTitle:@"enmu" style:UIBarButtonItemStylePlain target:self action:@selector(clickAction)];
    
    
    UIButton * button = [[UIButton alloc]initWithFrame:CGRectMake(100, 100, 100, 50)];
    [button setTitle:@"pop" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(clickPop) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
}


- (void)clickPop{
    
    RMNSOutputStreamViewController *vc = [RMNSOutputStreamViewController new];
    
    [self.dataSource addObject:vc];
    
//    [self.hashTable addObject:vc];
    
    [self.navigationController pushViewController:vc animated:YES];
}


- (void)clickAction{

}




- (NSHashTable*)hashTable{
    if (_hashTable == nil) {
        _hashTable = [NSHashTable weakObjectsHashTable];
    }
    return _hashTable;
}


- (NSMutableArray *)dataSource{
    if (_dataSource == nil) {
        _dataSource = [NSMutableArray array];
    }
    return _dataSource;
}

@end
