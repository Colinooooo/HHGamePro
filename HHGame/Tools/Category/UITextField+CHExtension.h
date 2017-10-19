//
//  UITextField+CHExtension.h
//  CheHu
//
//  Created by Victory on 2017/6/14.
//  Copyright © 2017年 iKaibei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextField (CHExtension)

/**
 * 快速创建UITextField
 */
+ (instancetype)fieldWithPlaceholder:(NSString *)placeholder fontSize:(UIFont *)size textColor:(UIColor *)color keyBoardType:(UIKeyboardType)type isNeedClearButton:(BOOL)isNeed;

@end
