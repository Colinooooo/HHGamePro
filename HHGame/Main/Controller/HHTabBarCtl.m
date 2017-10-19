//
//  HHTabBarCtl.m
//  HHGame
//
//  Created by Colin on 2017/10/17.
//  Copyright © 2017年 辉宏工作室. All rights reserved.
//

#import "HHTabBarCtl.h"
#import "HHNavCtl.h"
#import "HHInformationCtl.h"
#import "HHGuessCtl.h"
#import "HHAroundLeCtl.h"
#import "HHFoundCtl.h"
#import "HHPersonalCenterCtl.h"

@interface HHTabBarCtl ()

@end

@implementation HHTabBarCtl

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupItemTextAttrs];
    [self setupChildViewControllers];
}

#pragma mark - 设置item文字属性
- (void)setupItemTextAttrs {
    //设置文字正常时的属性
    NSMutableDictionary * normalAttrs = [NSMutableDictionary dictionary];
    normalAttrs[NSForegroundColorAttributeName] = RGB(157, 160, 164);
    normalAttrs[NSFontAttributeName] = Font(10);
    //选中文字的属性
    NSMutableDictionary * selectedAtrrs = [NSMutableDictionary dictionary];
    selectedAtrrs[NSForegroundColorAttributeName] = RGB(117, 17, 41);
    selectedAtrrs[NSFontAttributeName] = Font(10);
    //设置
    UITabBarItem * item = [UITabBarItem appearance];
    [item setTitleTextAttributes:normalAttrs forState:UIControlStateNormal];
    [item setTitleTextAttributes:selectedAtrrs forState:UIControlStateSelected];
}

#pragma mark - 设置子控制器
- (void)setupChildViewControllers {
    [self setupOneController:[[HHInformationCtl alloc] init] title:@"资讯" image:@"informationNor" selectImage:@"informationSel"];
    [self setupOneController:[[HHGuessCtl alloc] init] title:@"竞猜" image:@"guessNor" selectImage:@"guessSel"];
    [self setupOneController:[[HHAroundLeCtl alloc] init] title:@"转转乐" image:@"aroundNor" selectImage:@"aroundSel"];
    [self setupOneController:[[HHFoundCtl alloc] init] title:@"发现" image:@"foundNor" selectImage:@"foundSel"];
    [self setupOneController:[[HHPersonalCenterCtl alloc] init] title:@"个人中心" image:@"personalNor" selectImage:@"personalCenterSel"];
}

#pragma mark - 添加一个子控制器
- (void)setupOneController:(UIViewController *)viewController title:(NSString*)title image:(NSString*)image selectImage:(NSString*)selectedImage {
    viewController.title = title;
    HHNavCtl * navi = [[HHNavCtl alloc] initWithRootViewController:viewController];
    UITabBarItem * tabBarItem = [[UITabBarItem alloc] initWithTitle:title image:[[UIImage imageNamed:image] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[[UIImage imageNamed:selectedImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    navi.tabBarItem = tabBarItem;
    [self addChildViewController:navi];
}
@end
