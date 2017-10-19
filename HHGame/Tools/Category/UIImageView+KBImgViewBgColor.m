//
//  UIImageView+KBImgViewBgColor.m
//  KBShop
//
//  Created by Colin on 2017/9/11.
//  Copyright © 2017年 iKaibei. All rights reserved.
//

#import "UIImageView+KBImgViewBgColor.h"

@implementation UIImageView (KBImgViewBgColor)

//使用代码构建
- (instancetype)init
{
    self = [super init];
    if (self) {
        [self config];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self config];
    }
    return self;
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    [self config];
}

- (void)config
{
//    self.backgroundColor = ImgBgColor;
    self.contentMode = UIViewContentModeScaleAspectFill;
    self.clipsToBounds = YES;
}

@end
