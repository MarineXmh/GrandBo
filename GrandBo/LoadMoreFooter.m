//
//  LoadMoreFooter.m
//  GrandBo
//
//  Created by Xu Menghua on 15/9/20.
//  Copyright © 2015年 Xu Menghua. All rights reserved.
//

#import "LoadMoreFooter.h"

@implementation LoadMoreFooter

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)init {
    self = [super init];
    self.frame = CGRectMake(0, 0, 320, 20);
    _status = [[UILabel alloc]initWithFrame:CGRectMake(108, 0, 105, 20)];
    _status.textAlignment = NSTextAlignmentCenter;
    _status.font = [UIFont systemFontOfSize:10.0];
    [_status setText:@"上拉加载更多数据"];
    _loading = [[UIActivityIndicatorView alloc]initWithFrame:CGRectMake(80, 0, 20, 20)];
    [_loading setActivityIndicatorViewStyle:UIActivityIndicatorViewStyleGray];
    [self addSubview:_status];
    [self addSubview:_loading];
    return self;
}

- (void)beginRefresh {
    
    self.status.text = @"正在拼命加载数据";
    
    [self.loading startAnimating];
    self.refreshing = YES;
}

-(void)endRefresh {
    
    self.status.text = @"上拉加载更多数据";
    [self.loading stopAnimating];
    self.refreshing = NO;
}

@end
