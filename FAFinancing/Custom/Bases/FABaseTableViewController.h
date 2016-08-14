//
//  FABaseTableViewController.h
//  FAFinancing
//
//  Created by HouKangzhu on 16/8/8.
//  Copyright © 2016年 侯康柱. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FABaseTableViewController : UITableViewController

///添加下拉刷新  调用后请重写 refreshHeaderAction
- (void)addHeaderRefresh;
///添加上拉加载 调用后请重写 refreshFooterAction
- (void)addFooterRefresh;

///下拉刷新事件
- (void)refreshHeaderAction;
///上拉加载事件
- (void)refreshFooterAction;
/*!
 *  刷新结束 自己调.....不是自动调
 *
 *  @param isHeader 是头还是尾
 *  @param reload   是否刷新tableView
 */
- (void)refreshEnd:(BOOL)isHeader reload:(BOOL)reload;

@end
