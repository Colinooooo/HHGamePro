//
//  UILabel+TextHeight.m
//  CarOnlineConsult
//
//  Created by Apple on 15/8/10.
//  Copyright (c) 2015年 hadlink. All rights reserved.
//

#import "UILabel+TextHeight.h"

@implementation UILabel (TextHeight)
- (CGRect)getFrameWithContentString:(NSString *)ContentString
{
    //富文本设置文字行间距
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc]init];
    paragraphStyle.lineSpacing = 3;
    paragraphStyle.firstLineHeadIndent = 27;
    NSDictionary *attributes = @{ NSFontAttributeName:[UIFont systemFontOfSize:15], NSParagraphStyleAttributeName:paragraphStyle};
    self.attributedText = [[NSAttributedString alloc]initWithString:ContentString attributes:attributes];
    //获取设置文本间距以后的高度
    CGRect fram = [self.attributedText boundingRectWithSize:CGSizeMake(SCREEN_WIDTH-30, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin context:nil];
    return fram;
}


/**
 *  在所有的内容中, 把指定的文字设置指定的颜色
 *
 *  @param text     所有的文字
 *  @param textArr  指定的文字
 *  @param corlorArr 指定的颜色
 */
- (void)setAttributedWithText:(NSString *)text textArr:(NSArray *)textArr corlorArr:(NSArray *)corlorArr LineSpace:(CGFloat)lineSpace
{
    if (text && textArr && textArr.count == corlorArr.count) {
        
        NSMutableAttributedString *allValueString = [[NSMutableAttributedString alloc] initWithString:text];
        
        for (int i = 0; i<textArr.count; i++) {
            NSLog(@"%ld",textArr.count);
            NSString *key = [NSString stringWithFormat:@"%@",textArr[i]];
            NSLog(@"%@",textArr[i]);
            NSRange keyRange = [text rangeOfString:key];
            UIColor *tempCorlor = corlorArr[i];
            [allValueString addAttribute:NSForegroundColorAttributeName value:tempCorlor range:keyRange];
        }
        
        //防止数组中两个一样字符的情况, 就从后面开始寻找
        if (textArr.count == 2) {
            NSString *key = [NSString stringWithFormat:@"%@",textArr[1]];
            NSRange keyRange = [text rangeOfString:key options:NSBackwardsSearch];//从后面开始寻找
            UIColor *tempCorlor = corlorArr[1];
            [allValueString addAttribute:NSForegroundColorAttributeName value:tempCorlor range:keyRange];
        }
        
        //如果有换行 或者 字体宽度超过一行就设置行间距
        CGFloat textPX = [text sizeWithStringFont:self.font].width;
        if (textPX > SCREEN_WIDTH || [text rangeOfString:@"\n"].location != NSNotFound) {
            
            NSMutableParagraphStyle * paragraphStyle = [[NSMutableParagraphStyle alloc] init];
            [paragraphStyle setLineSpacing:lineSpace];
            [allValueString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [text length])];
        }
        
        self.attributedText = allValueString;
        
    } else {
        self.text = text;
    }
}

/**
 *  设置指定文字(分行)的行间距
 *
 *  @param lineSpace 行间距
 *  @param text      指定文字(分行)
 *  @param maxWidth  最大宽度
 *  @param headIndent  首行空格间隙
 */
- (void)setLineSpace:(CGFloat)lineSpace witrhString:(NSString *)text withFont:(UIFont *)font maxWidth:(CGFloat)maxWidth firstLineHeadIndent:(CGFloat)headIndent
{
    if (!text) return;
    
    NSMutableAttributedString * attributedString = [[NSMutableAttributedString alloc] initWithString:text];
    NSMutableParagraphStyle * paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    
    //如果有换行 或者 字体宽度超过一行就设置行间距
    CGFloat textPX = [text sizeWithStringFont:font].width;
    if (textPX > maxWidth || [text rangeOfString:@"\n"].location != NSNotFound) {
        [paragraphStyle setLineSpacing:lineSpace];
        paragraphStyle.firstLineHeadIndent = headIndent;
        [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [text length])];
        [self setAttributedText:attributedString];
        [self sizeToFit];
    } else {
        if (headIndent > 0) {
            paragraphStyle.firstLineHeadIndent = headIndent;
            [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [text length])];
        }
        [self setAttributedText:attributedString];
    }
}


@end
