//
//  ComposeButton.m
//  GrandBo
//
//  Created by Xu Menghua on 15/9/4.
//  Copyright (c) 2015年 Xu Menghua. All rights reserved.
//

#import "ComposeButton.h"

@implementation ComposeButton

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (CGRect)titleRectForContentRect:(CGRect)contentRect {
    return CGRectMake(0, contentRect.size.height - 13, contentRect.size.width, 10);
}

- (CGRect)imageRectForContentRect:(CGRect)contentRect {
    return CGRectMake(0, 0, 71, 71);
}

@end
