//
//  RMViewController.m
//  RMExtension
//
//  Created by zhangbin on 12/29/2020.
//  Copyright (c) 2020 zhangbin. All rights reserved.
//

#import "RMViewController.h"
#import "RMFirstViewController.h"
#import "RMSecondViewController.h"
#import "RMCATransitionViewController.h"
#import "RMGCDViewController.h"


@interface RMViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (strong,nonatomic)NSMutableArray<NSString*> *dataSource;

@property (strong,nonatomic)UITableView *tableView;

@end

@implementation RMViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationItem.title = @"RMExtension";
    [self.view addSubview:self.tableView];
}


- (void)clickBtn{
    RMSecondViewController *viewController = [RMSecondViewController new];
    [self presentViewController:viewController animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//MARK: TABLEVIEW DATASOURCE
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataSource.count;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"UITableViewCell"];
        cell.editingAccessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    cell.textLabel.text = self.dataSource[indexPath.row];
    return cell;
}


//MARK: TABLEVIEW DELEGATE
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    switch (indexPath.row) {
        case 0:
            [self.navigationController pushViewController:[RMFirstViewController new] animated:YES];
            break;
        case 1:
            [self.navigationController pushViewController:[RMSecondViewController new] animated:YES];
            break;
        case 2:
            [self.navigationController pushViewController:[RMCATransitionViewController new] animated:YES];
            break;
        case 3:
            [self.navigationController pushViewController:[RMGCDViewController new] animated:YES];
            break;
            
        default:
            break;
    }
}

//MARK: Lazy load
- (UITableView *)tableView{
    if (_tableView == nil) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height) style:UITableViewStyleGrouped];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UITableViewCell"];
        
    }
    return _tableView;
}


- (NSMutableArray*)dataSource{
    if (_dataSource == nil) {
        _dataSource = @[@"UIView+Extension",@"weakTimeTarget",@"隐式动画",@"GCD"].mutableCopy;
    }
    return _dataSource;
}
@end
