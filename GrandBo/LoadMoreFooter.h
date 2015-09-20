//
//  LoadMoreFooter.h
//  GrandBo
//
//  Created by Xu Menghua on 15/9/20.
//  Copyright © 2015年 Xu Menghua. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoadMoreFooter : UIView

@property (nonatomic, strong) UILabel *status;
@property (nonatomic, strong) UIActivityIndicatorView *loading;
@property (nonatomic, assign, getter=isRefreshing) bool refreshing;

- (void)beginRefresh;
- (void)endRefresh;

@end
