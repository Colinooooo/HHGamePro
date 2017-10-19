//
//  UIImage+DDNAdditions.h
//  DDNShopping
//
//  Created by 叶子 on 16/7/24.
//  Copyright © 2016年 sivan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (DDNAdditions)
+ (UIImage *)ddn_imageWithColor:(UIColor *)color;
+ (UIImage *)ddn_imageWithColor:(UIColor *)color size:(CGSize)size;
+ (UIImage *)ddn_generateQRCodeWithContent:(NSString *)content;

- (UIImage *)ddn_imageWithColor:(UIColor *)color;
- (UIImage *)resizedImageByWidth:(NSUInteger)width;
- (UIImage *)resizedImageByHeight:(NSUInteger)height;
- (UIImage *)resizedImageWithMinimumSize:(CGSize)size;
- (UIImage *)resizedImageWithMaximumSize:(CGSize)size;
- (UIImage*)resizedImageWithRect:(CGRect)rect;
- (UIImage*)scaleToSize:(CGSize)size;
@end
