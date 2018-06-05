//
//  HYTabBarController.m
//  live
//
//  Created by Jack on 2017/11/22.
//  Copyright © 2017年 胡勇. All rights reserved.
//

#import "HYTabBarController.h"


@interface HYTabBarController ()

@end

@implementation HYTabBarController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    //删除tabbar的阴影线
    [[UITabBar appearance] setShadowImage:[UIImage new]];
    [[UITabBar appearance] setBackgroundImage:[UIImage new]];
    
}

- (void)addAllChildVC{
    
    // 利用KVO来使用自定义的tabBar
//    [self setValue:[[HYCustomTabBar alloc] init] forKey:@"tabBar"];
    
   
}


- (void)addChildViewController:(UIViewController *)vc title:(NSString *)title image:(NSString *)imageName selectImage:(NSString *)selectImage{
    
    HYBaseNavController *nav = [[HYBaseNavController alloc] initWithRootViewController:vc];
    // 如果同时有navigationbar 和 tabbar的时候最好分别设置它们的title
    nav.tabBarItem.title = title;
    nav.tabBarItem.image = [UIImage imageNamed:imageName];
    UIImage *selectImg = [UIImage imageNamed:selectImage];
    nav.tabBarItem.selectedImage = [selectImg imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [self addChildViewController:nav];
}

- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item{
    
    id selectedViewController = self.selectedViewController;
    if ([selectedViewController isKindOfClass:[HYBaseNavController class]]) {
        
        HYBaseNavController *navVC = (HYBaseNavController *)selectedViewController;
        if (navVC.topViewController != navVC.viewControllers[0]) {
            return;
        }
        
        if ([navVC.topViewController isKindOfClass:[HYBaseViewController class]]) {
            
            HYBaseViewController *currentVC = (HYBaseViewController *)navVC.topViewController;
            [currentVC tabBarItemClicked];
        }
    }
    
    
}

- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
