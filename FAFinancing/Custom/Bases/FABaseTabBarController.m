//
//  FABaseTabBarController.m
//  FAFinancing
//
//  Created by HouKangzhu on 16/8/8.
//  Copyright © 2016年 侯康柱. All rights reserved.
//

#import "FABaseTabBarController.h"

@interface FABaseTabBarController ()

@end

@implementation FABaseTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSArray *vcNameArr = @[@"MainNav",
                           @"ProjectNav",
                           @"MessageNav",
                           @"MineNav"];
    NSArray *nameArr = @[@"首页",
                         @"项目",
                         @"消息",
                         @"我的"
                         ];
    NSMutableArray *navArr = [NSMutableArray array];
    int index = 0;
    for (NSString *vcName in vcNameArr) {
        UINavigationController *nav = (UINavigationController *)[FAFinancing primaryStoryBoardViewControllerWithIdentifier:vcName];
        [navArr addObject:nav];
        nav.tabBarItem.title = nameArr[index];
//        nav.navigationBar.tintColor = kTHEME_COLOR;
        nav.tabBarItem.image = [UIImage imageNamed:@"img_default2"];
        index ++ ;
    }
    self.viewControllers = navArr;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
