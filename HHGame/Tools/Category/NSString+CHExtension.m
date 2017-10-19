//
//  NSString+CHExtension.m
//  CheHu
//
//  Created by Victory on 2017/6/14.
//  Copyright © 2017年 iKaibei. All rights reserved.
//

#import "NSString+CHExtension.h"

@implementation NSString (CHExtension)

+ (NSString *)convertTimestamp:(NSString *)timeString {
    
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    formatter.timeZone = [NSTimeZone timeZoneWithName:@"Asia/Beijing"];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    
    NSDate* date = [NSDate dateWithTimeIntervalSince1970:[timeString doubleValue]];
    NSString* dateString = [formatter stringFromDate:date];
    return dateString;
}

//年月日  时分秒
+ (NSString *)convertTimes:(NSString *)timeString {
    
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    formatter.timeZone = [NSTimeZone timeZoneWithName:@"Asia/Beijing"];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    
    NSDate* date = [NSDate dateWithTimeIntervalSince1970:[timeString doubleValue]];
    NSString* dateString = [formatter stringFromDate:date];
    return dateString;
}

+ (NSAttributedString *)attributedStringWith:(NSString *)string charaterString:(NSString *)str color:(UIColor*)color subColor:(UIColor *)subColor font:(CGFloat)font subFont:(CGFloat)subFont {
    
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:string];
    NSRange range = [string rangeOfString:str];
    
    if (!string || !str || ![string containsString:str]) {
        return nil;
    }
    
    if (range.location != NSNotFound) {
        NSString *subString = [string substringToIndex:range.location+1];
        [attributedString addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:font] range:NSMakeRange(0,subString.length)];
        [attributedString addAttribute:NSForegroundColorAttributeName value:color range:NSMakeRange(0,subString.length)];
        
        [attributedString addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:subFont] range:NSMakeRange(range.location,string.length-subString.length+1)];
        [attributedString addAttribute:NSForegroundColorAttributeName value:subColor range:NSMakeRange(range.location,string.length-subString.length+1)];
        
    }else{
        NSLog(@"Not Found");
        return nil;
    }
    return attributedString;
}

+ (NSMutableAttributedString *)attributedStringWith:(NSString *)string charaterString:(NSString *)str superDick:(NSDictionary*)superDick subDick:(NSDictionary*)subDick {
    
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:string];
    NSRange range = [string rangeOfString:str];
    
    if (!string || !str || ![string containsString:str]) {
        return nil;
    }
    
    if (range.location != NSNotFound) {
        NSString *subString = [string substringToIndex:range.location+1];
        [attributedString addAttributes:superDick range:NSMakeRange(0,subString.length)];
        [attributedString addAttributes:subDick range:NSMakeRange(range.location,string.length-subString.length+1)];
    }else{
        NSLog(@"Not Found");
        return nil;
    }
    return attributedString;
}

/**
 *  得到当前时间
 *
 *  @return yyyyMMddHHmmssSSS
 */
+ (NSString *)getNowDate
{
    NSDate *senddate = [NSDate date];
    NSDateFormatter *dateformatter=[[NSDateFormatter alloc] init];
    [dateformatter setTimeZone:[NSTimeZone localTimeZone]];
    [dateformatter setDateFormat:@"yyyyMMddHHmmssSSS"];
    NSString *locationString = [dateformatter stringFromDate:senddate];
    return locationString;
}

@end
