//
//  NSDictionary+Extension.m
//  KBShop
//
//  Created by Victory on 2017/8/29.
//  Copyright © 2017年 iKaibei. All rights reserved.
//

#import "NSDictionary+Extension.h"

@implementation NSDictionary (Extension)

/*!
 * @brief 把格式化的JSON格式的字符串转换成字典
 * @param jsonString JSON格式的字符串
 * @return 返回字典
 */

+ (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString {
    if (jsonString == nil) {
        return nil;
    }
    NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    NSError *err;
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&err];
    if(err) {
        NSLog(@"json解析失败：%@",err);
        return nil;
    }
    return dic;
}

- (id)jsonObjectForKey:(id)aKey{
    if ([[self objectForKey:aKey] isKindOfClass:[NSNull class]]){
        return nil;
    }
    return [self objectForKey:aKey];
}

+(NSDictionary *)nullDic:(NSDictionary *)myDic

{
    
    NSArray *keyArr = [myDic allKeys];
    
    NSMutableDictionary *resDic = [[NSMutableDictionary alloc]init];
    
    for (int i = 0; i < keyArr.count; i ++)
        
    {
        
        id obj = [myDic objectForKey:keyArr[i]];
        
        
        
        obj = [self changeType:obj];
        
        
        
        [resDic setObject:obj forKey:keyArr[i]];
        
    }
    
    return resDic;
    
}


//将NSDictionary中的Null类型的项目转化成@""

+(NSArray *)nullArr:(NSArray *)myArr

{
    
    NSMutableArray *resArr = [[NSMutableArray alloc] init];
    
    for (int i = 0; i < myArr.count; i ++)
        
    {
        
        id obj = myArr[i];
        
        
        
        obj = [self changeType:obj];
        
        
        
        [resArr addObject:obj];
        
    }
    
    return resArr;
    
}


//将NSString类型的原路返回

+(NSString *)stringToString:(NSString *)string

{
    
    return string;
    
}


//将Null类型的项目转化成@""

+(NSString *)nullToString

{
    
    return @"";
    
}


#pragma mark - 公有方法

//类型识别:将所有的NSNull类型转化成@""

+(id)changeType:(id)myObj

{
    
    if ([myObj isKindOfClass:[NSDictionary class]])
        
    {
        
        return [self nullDic:myObj];
        
    }
    
    else if([myObj isKindOfClass:[NSArray class]])
        
    {
        
        return [self nullArr:myObj];
        
    }
    
    else if([myObj isKindOfClass:[NSString class]])
        
    {
        
        return [self stringToString:myObj];
        
    }
    
    else if([myObj isKindOfClass:[NSNull class]])
        
    {
        
        return [self nullToString];
        
    }
    
    else
        
    {
        
        return myObj;
        
    }
    
}

@end
