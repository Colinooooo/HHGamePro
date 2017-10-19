//
//  NSDictionary+Extension.h
//  KBShop
//
//  Created by Victory on 2017/8/29.
//  Copyright © 2017年 iKaibei. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (Extension)
/*!
 * @brief 把格式化的JSON格式的字符串转换成字典
 * @param jsonString JSON格式的字符串
 * @return 返回字典
 */

+ (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString;

// JSON库返回的值有可能是NSNull，直接将它替换为nil
- (id)jsonObjectForKey:(id)aKey;

//类型识别:将所有的NSNull类型转化成@""
+ (id)changeType:(id)myOb;

@end
