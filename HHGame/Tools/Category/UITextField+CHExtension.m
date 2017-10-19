//
//  UITextField+CHExtension.m
//  CheHu
//
//  Created by Victory on 2017/6/14.
//  Copyright © 2017年 iKaibei. All rights reserved.
//

#import "UITextField+CHExtension.h"

@implementation UITextField (CHExtension)

+ (instancetype)fieldWithPlaceholder:(NSString *)placeholder fontSize:(UIFont *)size textColor:(UIColor *)color keyBoardType:(UIKeyboardType)type isNeedClearButton:(BOOL)isNeed {
    
    UITextField *field = [[UITextField alloc] init];
    field.placeholder = placeholder;
    field.font = size;
    field.textColor = color;
    field.keyboardType = type;
    if (isNeed) {
        [field setClearButtonMode:UITextFieldViewModeWhileEditing];
    }
    return field;
}

@end
