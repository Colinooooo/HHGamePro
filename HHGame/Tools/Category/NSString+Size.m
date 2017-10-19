//
//  NSString+Size.m
//  FOYOFitness
//
//  Created by Cookie on 15/5/25.
//  Copyright (c) 2015年 FOYOFitness. All rights reserved.
//

#import "NSString+Size.h"
#define KControlSpaceY 4
@implementation NSString (Size)


/**
 *  获取字符串的Size (获取单行文字的Size时使用)
 *
 *  @param font 字体大小 : font 为 nil 则为系统默认字体大小
 *
 *  @return 字符串的Sise
 */
- (CGSize)sizeWithStringFont:(UIFont *)font
{
    if (!font) {
        font = [UIFont systemFontOfSize:[UIFont systemFontSize]];
    }

    return [self sizeWithAttributes:@{NSFontAttributeName : font}];
}

/**
 *  获取字符串的Size (获取多行文字的Size时使用, 每行之间有换行12间隔)
 *
 *  @param font 字体大小 : font 为 nil 则为系统默认字体大小
 *  @param maxSize 文字的最大Size
 *
 *  @return 字符串的Sise
 */
- (CGSize)sizeWithStringFont:(UIFont *)font maxSize:(CGSize)maxSize
{
    if (!font) {
        font = [UIFont systemFontOfSize:[UIFont systemFontSize]];
    }
    
    NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
    [attrs setObject:font forKey:NSFontAttributeName];
    
    //如果有换行 或者 字体宽度超过一行就设置行间距
    CGFloat textPX = [self sizeWithStringFont:font].width;
    if (textPX > SCREEN_WIDTH || [self rangeOfString:@"\n"].location != NSNotFound) {
        NSMutableParagraphStyle * paragraphStyle = [[NSMutableParagraphStyle alloc] init];
        [paragraphStyle setLineSpacing:KControlSpaceY];//设置行间距为4
        [attrs setObject:paragraphStyle forKey:NSParagraphStyleAttributeName];
    }
    
    return [self boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attrs context:nil].size;
}

/**
 *  获取字符串的Size (获取多行文字的Size时使用, 每行之间没有换行间隔)
 *
 *  @param font 字体大小 : font 为 nil 则为系统默认字体大小
 *  @param maxSize 文字的最大Size
 *
 *  @return 字符串的Sise
 */
- (CGSize)sizeWithStringFont:(UIFont *)font maxSize:(CGSize)maxSize withSpace:(CGFloat)space
{
    if (!font) {
        font = [UIFont systemFontOfSize:[UIFont systemFontSize]];
    }
    
    NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
    [attrs setObject:font forKey:NSFontAttributeName];
    
    if (space >0) {
        //如果有换行 或者 字体宽度超过一行就设置行间距
        CGFloat textPX = [self sizeWithStringFont:font].width;
        if (textPX > SCREEN_WIDTH || [self rangeOfString:@"\n"].location != NSNotFound) {
            NSMutableParagraphStyle * paragraphStyle = [[NSMutableParagraphStyle alloc] init];
            [paragraphStyle setLineSpacing:space];//设置行间距为12
            [attrs setObject:paragraphStyle forKey:NSParagraphStyleAttributeName];
        }
    }
    return [self boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attrs context:nil].size;
}

/**
 *  获取字符串的Size (获取多行文字的Size时使用, 每行之间有换行间隔)
 *
 *  @param font 字体大小 : font 为 nil 则为系统默认字体大小
 *  @param maxSize 文字的最大Size
 *  @param maxSize 首行的占位空白宽度
 *
 *  @return 字符串的Sise
 */
- (CGSize)sizeWithStringFont:(UIFont *)font maxSize:(CGSize)maxSize withSpace:(CGFloat)space firstLineHeadIndent:(CGFloat)headIndent
{
    if (!font) {
        font = [UIFont systemFontOfSize:[UIFont systemFontSize]];
    }
    
    NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
    [attrs setObject:font forKey:NSFontAttributeName];
    
    if (space >0) {
        //如果有换行 或者 字体宽度超过一行就设置行间距
        CGFloat textPX = [self sizeWithStringFont:font].width;
        if (textPX+headIndent > maxSize.width || [self rangeOfString:@"\n"].location != NSNotFound) {
            NSMutableParagraphStyle * paragraphStyle = [[NSMutableParagraphStyle alloc] init];
            [paragraphStyle setLineSpacing:space];
            paragraphStyle.firstLineHeadIndent = headIndent;
            [attrs setObject:paragraphStyle forKey:NSParagraphStyleAttributeName];
        }
    }
    return [self boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attrs context:nil].size;
}

-(BOOL)containsString:(NSString *)str{
    NSRange range = [self rangeOfString:str];
    return range.length != 0;
}

@end
