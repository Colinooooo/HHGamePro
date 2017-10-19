//
//  UILabel+TextHeight.h
//  CarOnlineConsult
//
//  Created by Apple on 15/8/10.
//  Copyright (c) 2015年 hadlink. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (TextHeight)
/** 根据string类型富文本排列得到高度 */
- (CGRect)getFrameWithContentString:(NSString *)ContentString;
/**
 *  在所有的内容中, 把指定的文字设置指定的颜色
 *
 *  @param text     所有的文字
 *  @param textArr  指定的文字
 *  @param corlorArr 指定的颜色
 */
- (void)setAttributedWithText:(NSString *)text textArr:(NSArray *)textArr corlorArr:(NSArray *)corlorArr LineSpace:(CGFloat)lineSpace;

/**
 *  设置指定文字(分行)的行间距
 *
 *  @param lineSpace 行间距
 *  @param text      指定文字(分行)
 *  @param maxWidth  最大宽度
 *  @param headIndent  首行空格间隙
 */
- (void)setLineSpace:(CGFloat)lineSpace witrhString:(NSString *)text withFont:(UIFont *)font maxWidth:(CGFloat)maxWidth firstLineHeadIndent:(CGFloat)headIndent;

@end
