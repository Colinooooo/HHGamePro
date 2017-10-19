//
//  HHNavCtl.m
//  HHGame
//
//  Created by Colin on 2017/10/17.
//  Copyright © 2017年 辉宏工作室. All rights reserved.
//

#import "HHNavCtl.h"

@interface HHNavCtl ()

@end

@implementation HHNavCtl

- (void)viewDidLoad {
    [super viewDidLoad];
    [[UINavigationBar appearance] setBackgroundImage:[UIImage ddn_imageWithColor:RGB(117, 17, 41)] forBarMetrics:UIBarMetricsDefault];
    [[UINavigationBar appearance] setTitleTextAttributes:@{/*NSFontAttributeName:[UIFont systemFontOfSize:19],*/ NSForegroundColorAttributeName:[UIColor whiteColor]}];
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    [[UINavigationBar appearance] setShadowImage:[UIImage new]];
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {

    if (!self.viewControllers.count) {

    } else {
        //设置tabbar隐藏
        viewController.hidesBottomBarWhenPushed = YES;

        UIButton *backButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 60, 40)];
        [backButton setTitle:@"返回" forState:UIControlStateNormal];
        [backButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        backButton.contentEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 0);
        [backButton addTarget:self action:@selector(backButtonClick) forControlEvents:UIControlEventTouchUpInside];

        [backButton setImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
        UIBarButtonItem * barButtonItem = [[UIBarButtonItem alloc]initWithCustomView:backButton];
        viewController.navigationItem.leftBarButtonItem = barButtonItem;
        self.navigationBarHidden = NO;
    }

    [super pushViewController:viewController animated:YES];
}

#pragma mark - 点击左上角返回按钮
- (void)backButtonClick{
    [self popViewControllerAnimated:YES];
}

#pragma mark - 决定pop手势是否有效
- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer{
    return self.viewControllers.count > 1;
}

@end
