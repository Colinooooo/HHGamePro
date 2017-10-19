//
//  HHMacro.h
//  HHGame
//
//  Created by Colin on 2017/10/19.
//  Copyright © 2017年 辉宏工作室. All rights reserved.
//

#ifndef HHMacro_h
#define HHMacro_h

//沙河存储
#define UserDefaultsSetObj(obj , key) \
[[NSUserDefaults standardUserDefaults] setObject:(obj) forKey:(key)];\
[[NSUserDefaults standardUserDefaults] synchronize]
//沙河取出数据
#define UserDefaultsObjForKey(key) [[NSUserDefaults standardUserDefaults] objectForKey:key]

//屏幕的宽/高/大小
#define HH_WIDTH [UIScreen mainScreen].bounds.size.width
#define HH_HEIGHT [UIScreen mainScreen].bounds.size.height
#define HH_SCREEN_SISE [UIScreen mainScreen].bounds.size

// 获取RGB颜色
#define RGBA(r,g,b,a) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:(a)]
#define RGB(r,g,b) RGBA(r,g,b,1.0f)
// 设置随机颜色
#define RANDOMCOLOR [UIColor colorWithRed:arc4random_uniform(256)/255.0 green:arc4random_uniform(256)/255.0 blue:arc4random_uniform(256)/255.0 alpha:1.0]

//程序主色调
#define BaseColor  RGB(117, 17, 41)

//字体大小设置
#define Font(a)  [UIFont systemFontOfSize:a]

//默认占位图
#define PlaceHolderImgOfDefault       [UIImage imageNamed:@"userPlaceholderImg"]
#define PlaceHolderImgOfUserHeadImg   [UIImage imageNamed:@"userPlaceholderImg"]

//线条统一颜色值
#define HHLineColor RGB(229, 229, 229)

/*--------------------------------- 设置 view 圆角和边框 ----------------------------------*/
#define HHViewBorderRadius(View, Radius, Width, Color)\
\
[View.layer setCornerRadius:(Radius)];\
[View.layer setMasksToBounds:YES];\
[View.layer setBorderWidth:(Width)];\
[View.layer setBorderColor:[Color CGColor]]

#endif /* HHMacro_h */
