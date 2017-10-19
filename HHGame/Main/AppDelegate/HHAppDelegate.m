//
//  HHAppDelegate.m
//  HHGame
//
//  Created by Colin on 2017/10/19.
//  Copyright © 2017年 辉宏工作室. All rights reserved.
//

#import "HHAppDelegate.h"
#import "HHTabBarCtl.h"
@interface HHAppDelegate ()

@end

@implementation HHAppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    [self setRootViewCtl];
    
    return YES;
}

- (void)setRootViewCtl
{
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    self.window.rootViewController = [[HHTabBarCtl alloc] init];
}

- (void)applicationWillResignActive:(UIApplication *)application {
    
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    
}


- (void)applicationWillTerminate:(UIApplication *)application {
    
}

@end
