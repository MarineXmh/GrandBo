//
//  CellToolBar.m
//  GrandBo
//
//  Created by Xu Menghua on 15/9/21.
//  Copyright © 2015年 Xu Menghua. All rights reserved.
//

#import "CellToolBar.h"
#import "CellToolBarButton.h"

@implementation CellToolBar

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)init {
    self = [super init];
    
    self.expand = [CellToolBarButton buttonWithType:UIButtonTypeCustom];
    self.expand.frame = CGRectMake(0, 0, 100, 21);
    [self.expand setTitle:@"转发" forState:UIControlStateNormal];
    [self.expand setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.expand setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
    self.expand.titleLabel.textAlignment = NSTextAlignmentLeft;
    self.expand.titleLabel.font = [UIFont systemFontOfSize:10.0];
    [self.expand setImage:[UIImage imageNamed:@"toolbar_icon_retweet"] forState:UIControlStateNormal];
    [self addSubview:self.expand];
    //NSLog(@"x=%f y=%f w=%f h=%f", _expand.titleLabel.frame.origin.x,  _expand.titleLabel.frame.origin.y, _expand.titleLabel.frame.size.width, _expand.titleLabel.frame.size.height);
    //NSLog(@"%@", _expand.titleLabel.text);
    
    self.comment = [CellToolBarButton buttonWithType:UIButtonTypeCustom];
    self.comment.frame = CGRectMake(_expand.frame.origin.x + _expand.frame.size.width, 0, 100, 21);
    [self.comment setTitle:@"评论" forState:UIControlStateNormal];
    [self.comment setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.comment setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
    self.comment.titleLabel.font = [UIFont systemFontOfSize:10.0];
    [self.comment setImage:[UIImage imageNamed:@"toolbar_icon_comment"] forState:UIControlStateNormal];
    [self addSubview:self.comment];
    
    self.good = [CellToolBarButton buttonWithType:UIButtonTypeCustom];
    self.good.frame = CGRectMake(_comment.frame.origin.x + _comment.frame.size.width, 0, 100, 21);
    [self.good setTitle:@"赞" forState:UIControlStateNormal];
    [self.good setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.good setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
    self.good.titleLabel.font = [UIFont systemFontOfSize:10.0];
    [self.good setImage:[UIImage imageNamed:@"toolbar_icon_unlike"] forState:UIControlStateNormal];
    [self addSubview:self.good];
    
    return self;
}

@end
