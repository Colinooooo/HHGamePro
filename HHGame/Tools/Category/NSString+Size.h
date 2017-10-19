//
//  NSString+Size.h
//  FOYOFitness
//
//  Created by Cookie on 15/5/25.
//  Copyright (c) 2015年 FOYOFitness. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Size)


/**
 *  获取字符串的Size (获取单行文字的Size时使用)
 *
 *  @param font 字体大小 : font 为 nil 则为系统默认字体大小
 *
 *  @return 字符串的Sise
 */
- (CGSize)sizeWithStringFont:(UIFont *)font;


/**
 *  获取字符串的Size (获取多行文字的Size时使用)
 *
 *  @param font 字体大小 : font 为 nil 则为系统默认字体大小
 *  @param maxSize 文字的最大Size
 *
 *  @return 字符串的Sise
 */
- (CGSize)sizeWithStringFont:(UIFont *)font maxSize:(CGSize)maxSize;

/**
 *  获取字符串的Size (获取多行文字的Size时使用, 每行之间没有换行间隔)
 *
 *  @param font 字体大小 : font 为 nil 则为系统默认字体大小
 *  @param maxSize 文字的最大Size
 *
 *  @return 字符串的Sise
 */
- (CGSize)sizeWithStringFont:(UIFont *)font maxSize:(CGSize)maxSize withSpace:(CGFloat)space;

/**
 *  获取字符串的Size (获取多行文字的Size时使用, 每行之间有换行间隔)
 *
 *  @param font 字体大小 : font 为 nil 则为系统默认字体大小
 *  @param maxSize 文字的最大Size
 *  @param maxSize 首行的占位空白宽度
 *
 *  @return 字符串的Sise
 */
- (CGSize)sizeWithStringFont:(UIFont *)font maxSize:(CGSize)maxSize withSpace:(CGFloat)space firstLineHeadIndent:(CGFloat)headIndent;


@end
