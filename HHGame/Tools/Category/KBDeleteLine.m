//
//  KBDeleteLine.m
//  KBShop
//
//  Created by Colin on 2017/8/31.
//  Copyright © 2017年 iKaibei. All rights reserved.
//

#import "KBDeleteLine.h"

@implementation KBDeleteLine

- (void)drawRect:(CGRect)rect
{
    [super drawRect:rect];
    [self.textColor set];
    CGFloat w = rect.size.width;
    CGFloat h = rect.size.height;
    UIRectFill(CGRectMake(0, h * 0.5, w, 1));
}

@end
