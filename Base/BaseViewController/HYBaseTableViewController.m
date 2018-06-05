//
//  HYBaseTableViewController.m
//  live
//
//  Created by Jack on 2017/11/28.
//  Copyright © 2017年 胡勇. All rights reserved.
//

#import "HYBaseTableViewController.h"

@interface HYBaseTableViewController ()

@end

@implementation HYBaseTableViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.backgroundColor = KAPP_TableView_BgColor;
    [self setupNav];
}

- (void)viewWillDisappear:(BOOL)animated{
    
    [self.view endEditing:YES];
}

- (void)setupNav{
    
    self.edgesForExtendedLayout = UIRectEdgeNone;
    //设置导航栏的颜色
    self.navigationController.navigationBar.barTintColor = KAPP_NAV_COLOR;
    //设置导航栏的字体颜色
    [self.navigationController.navigationBar setTitleTextAttributes:
     @{NSForegroundColorAttributeName:KAPP_WHITE_COLOR}];
    self.navigationController.navigationBar.translucent = NO;
    
    //设置返回按钮的颜色为白色
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName : [UIColor whiteColor]};
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    [self.view endEditing:YES];
    
}

#pragma mark - lazyload
- (NSMutableArray *)datalist{
    
    if (!_datalist) {
        _datalist = [NSMutableArray array];
    }
    return _datalist;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
