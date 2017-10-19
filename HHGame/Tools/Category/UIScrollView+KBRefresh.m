//
//  UIScrollView+KBRefresh.m
//  KBShop
//
//  Created by Victory on 2017/8/23.
//  Copyright © 2017年 iKaibei. All rights reserved.
//

#import "UIScrollView+KBRefresh.h"
#import <MJRefresh/MJRefresh.h>

@implementation UIScrollView (KBRefresh)

- (void)setRefreshWithHeaderBlock:(void (^)())headerBlock footerBlock:(void (^)())footerBlock{
    
    if (headerBlock) {
        MJRefreshNormalHeader *header= [MJRefreshNormalHeader headerWithRefreshingBlock:^{
            if (headerBlock) {
                headerBlock();
            }
        }];
        header.lastUpdatedTimeLabel.hidden = YES;
        header.stateLabel.hidden = YES;
        self.mj_header = header;
    }
    
    if (footerBlock) {
        MJRefreshAutoNormalFooter *footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
            footerBlock();
        }];
        [footer setTitle:@"暂无更多数据" forState:MJRefreshStateNoMoreData];
        [footer setTitle:@"" forState:MJRefreshStateIdle];
        footer.refreshingTitleHidden = YES;
        self.mj_footer = footer;
    }
}

- (void)headerBeginRefreshing {
    [self.mj_header beginRefreshing];
}

- (void)headerEndRefreshing {
    [self.mj_header endRefreshing];
}

- (void)footerEndRefreshing {
    [self.mj_footer endRefreshing];
}

- (void)footerNoMoreData {
    [self.mj_footer setState:MJRefreshStateNoMoreData];
}

- (void)footerReset {
    [self.mj_footer resetNoMoreData];
}

- (void)hideFooterRefresh{
    self.mj_footer.hidden = YES;
}

- (void)hideHeaderRefresh{
    self.mj_header.hidden = YES;
}

@end
