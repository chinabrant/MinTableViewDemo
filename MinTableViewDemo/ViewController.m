//
//  ViewController.m
//  MinTableViewDemo
//
//  Created by brant on 2017/12/19.
//  Copyright © 2017年 Brant. All rights reserved.
//

#import "ViewController.h"
#import "YTTableView.h"
#import "ViewModel.h"

@interface ViewController ()

@property (nonatomic, strong) YTTableView *tableView;
@property (nonatomic, strong) ViewModel *viewModel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.tableView];
    self.tableView.frame = self.view.bounds;
    
    [self bindActions];
    
    self.tableView.sections = self.viewModel.sections;
}

- (void)bindActions {
    
    /*
     
     关于事件处理：
     1、建议项目用路由，cell的事件直接在cell内部处理掉。
     2、如果不用路由，如果cell上有个button什么的，点击要处理，可以在cell的view model里面声明对应的RACSignal。再进行订阅。点击button的时候，发送事件就可以处理了。
     3、cell的点击处理还可以用下面的这个didSelectRow来处理。
     
     */
    self.tableView.didSelectRow = ^(id viewModel, NSString *sectionKey) {
        // 点击事件在这里处理
    };
}

#pragma mark - lazy load

- (YTTableView *)tableView {
    if (!_tableView) {
        _tableView = [[YTTableView alloc] init];
        _tableView.backgroundColor = [UIColor colorWithRed:0xef/255.0 green:0xef/255.0 blue:0xef/255.0 alpha:1];
        _tableView.tableFooterView = [UIView new];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    
    return _tableView;
}

- (ViewModel *)viewModel {
    if (!_viewModel) {
        _viewModel = [ViewModel new];
    }
    
    return _viewModel;
}

@end
