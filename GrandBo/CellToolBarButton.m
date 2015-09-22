//
//  CellToolBarButton.m
//  GrandBo
//
//  Created by Xu Menghua on 15/9/21.
//  Copyright © 2015年 Xu Menghua. All rights reserved.
//

#import "CellToolBarButton.h"

@implementation CellToolBarButton

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (CGRect)titleRectForContentRect:(CGRect)contentRect {
    return CGRectMake(contentRect.origin.x + 51, contentRect.origin.y, 50, 21);
}

- (CGRect)imageRectForContentRect:(CGRect)contentRect {
    return CGRectMake(contentRect.origin.x + 25, contentRect.origin.y, 21, 21);
}

@end
