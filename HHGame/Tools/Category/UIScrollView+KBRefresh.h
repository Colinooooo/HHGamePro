//
//  UIScrollView+KBRefresh.h
//  KBShop
//
//  Created by Victory on 2017/8/23.
//  Copyright © 2017年 iKaibei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIScrollView (KBRefresh)

- (void)setRefreshWithHeaderBlock:(void(^)())headerBlock footerBlock:(void(^)())footerBlock;

- (void)headerBeginRefreshing;
- (void)headerEndRefreshing;

- (void)footerEndRefreshing;
- (void)footerNoMoreData;
- (void)footerReset;

- (void)hideHeaderRefresh;
- (void)hideFooterRefresh;

@end
