//
//  AppDelegate.m
//  ZHULife
//
//  Created by leileigege on 2016/12/8.
//  Copyright © 2016年 leileigege. All rights reserved.
//

#import "AppDelegate.h"
#import <CYLTabBarController.h>
#import "LLPlusButton.h"
#import "HomePageViewController.h"
#import "ClassifyViewController.h"
#import "MyCollectViewController.h"
#import "SetViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    
    [LLPlusButton registerPlusButton];
    
    
    CYLTabBarController *tabBarController = [[CYLTabBarController alloc] init];
    // 设置属性数组
    tabBarController.tabBarItemsAttributes = [self attributesForTabBarItem];
      [tabBarController.tabBar setBarTintColor:[UIColor colorWithRed:20/255.0 green:155/255.0 blue:213/255.0 alpha:1.0]];
    tabBarController.viewControllers = [self viewControllers];
    // 设置window的根视图控制器
    [self customizeTabBarAppearance:tabBarController];
//    [[tabBarController appearance] setBackgroundColor:[UIColor redColor]]
    self.window.rootViewController = tabBarController;
    
    return YES;
 
}
- (NSArray *)viewControllers
{
    
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"LLStoryboard" bundle:[NSBundle mainBundle]];
    HomePageViewController *homePageViewController = [storyboard instantiateViewControllerWithIdentifier:@"homePageViewController"];
    UINavigationController *navigationController1 = [[UINavigationController alloc] initWithRootViewController:homePageViewController];
    
    ClassifyViewController *classifyViewController = [storyboard instantiateViewControllerWithIdentifier:@"classifyViewController"];
    UINavigationController *navigationController2 = [[UINavigationController alloc] initWithRootViewController:classifyViewController];
    
    
    MyCollectViewController *myCollectViewController = [storyboard instantiateViewControllerWithIdentifier:@"MyCollectViewController"];
    UINavigationController *navigationController3 = [[UINavigationController alloc] initWithRootViewController:myCollectViewController];
    
    
    SetViewController *setViewController = [storyboard instantiateViewControllerWithIdentifier:@"SetViewController"];
    UINavigationController *navigationController4 = [[UINavigationController alloc] initWithRootViewController:setViewController];

    
    return @[navigationController1, navigationController2,navigationController3,navigationController4];
}

- (NSArray *)attributesForTabBarItem
{
    NSDictionary *dict1 = @{
                             CYLTabBarItemTitle : @"首页",
                            CYLTabBarItemImage : @"home_classify_25x25_",
                            CYLTabBarItemSelectedImage : @"home_classify_selected_25x25_",
                            };
    NSDictionary *dict2 = @{
                            CYLTabBarItemTitle : @"菜单",
                            CYLTabBarItemImage : @"home_Recipe_book_25x25_",
                            CYLTabBarItemSelectedImage : @"home_Recipe_book_selected_25x25_",
                            };
    NSDictionary *dict3 = @{
                            CYLTabBarItemTitle : @"我的收藏",
                            CYLTabBarItemImage : @"my_collect",
                            CYLTabBarItemSelectedImage : @"my_collect_selected",
                            };
    NSDictionary *dict4 = @{
                            CYLTabBarItemTitle : @"设置",
                            CYLTabBarItemImage : @"set",
                            CYLTabBarItemSelectedImage : @"set_selected",
                            };


    
    NSArray *tabBarItemsAttributes = @[ dict1, dict2,dict3,dict4];
    return tabBarItemsAttributes;
}


- (void)customizeTabBarAppearance:(CYLTabBarController *)tabBarController {
    // Customize UITabBar height
    // 自定义 TabBar 高度
    tabBarController.tabBarHeight = 49.f;
    
    // set the text color for unselected state
    // 普通状态下的文字属性
    NSMutableDictionary *normalAttrs = [NSMutableDictionary dictionary];
    normalAttrs[NSForegroundColorAttributeName] =[UIColor grayColor];
    
    // set the text color for selected state
    // 选中状态下的文字属性
    NSMutableDictionary *selectedAttrs = [NSMutableDictionary dictionary];
    selectedAttrs[NSForegroundColorAttributeName] = LLGreenColor;
    
    // set the text Attributes
    // 设置文字属性
    UITabBarItem *tabBar = [UITabBarItem appearance];
    [tabBar setTitleTextAttributes:normalAttrs forState:UIControlStateNormal];
    [tabBar setTitleTextAttributes:selectedAttrs forState:UIControlStateSelected];

    
}






























- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
