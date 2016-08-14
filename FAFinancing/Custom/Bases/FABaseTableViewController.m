//
//  FABaseTableViewController.m
//  FAFinancing
//
//  Created by HouKangzhu on 16/8/8.
//  Copyright © 2016年 侯康柱. All rights reserved.
//

#import "FABaseTableViewController.h"

@interface FABaseTableViewController ()

@end

@implementation FABaseTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)addDefaultBg {
    [self.view addSubview:self.defaultBgView];
//    _defaultBgView.sd_layout.centerYEqualToView(self.tableView).centerXEqualToView(self.tableView).widthIs(200).heightIs(200);
    weakSelf(self);
    [self.defaultBgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(weakSelf.view);
        make.centerY.equalTo(weakSelf.view).with.offset(-44);
        make.width.and.height.mas_equalTo(200);
    }];
}


- (void)addHeaderRefresh {
    weakSelf(self)
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [weakSelf refreshHeaderAction];
        [weakSelf.tableView.mj_header beginRefreshing];
    }];
}

- (void)addFooterRefresh {
    weakSelf(self)
    self.tableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        [weakSelf refreshFooterAction];
        [weakSelf.tableView.mj_footer beginRefreshing];
    }];
}

/**
 *  下拉刷新事件
 */
- (void)refreshHeaderAction {
    
}

/**
 *  上拉加载事件
 */
- (void)refreshFooterAction {
    
}

- (void)refreshEnd:(BOOL)isHeader reload:(BOOL)reload {
    weakSelf(self)
    dispatch_async(dispatch_get_main_queue(), ^{
        if (reload) {
            [weakSelf.tableView reloadData];
        }
        if (isHeader) {
            [weakSelf.tableView.mj_header endRefreshing];
        }
        else {
            [weakSelf.tableView.mj_footer endRefreshing];
        }
    });
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
