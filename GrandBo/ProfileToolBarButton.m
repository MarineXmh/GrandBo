//
//  ProfileToolBarButton.m
//  GrandBo
//
//  Created by Xu Menghua on 15/9/23.
//  Copyright © 2015年 Xu Menghua. All rights reserved.
//

#import "ProfileToolBarButton.h"

@implementation ProfileToolBarButton

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
+ (ProfileToolBarButton *)initButtonWithFrame:(CGRect)frame {
    ProfileToolBarButton *btn = [ProfileToolBarButton buttonWithType:UIButtonTypeCustom];
    //NSLog(@"x=%f y=%f w=%f h=%f", frame.origin.x, frame.origin.y, frame.size.width, frame.size.height);
    
    btn.frame = CGRectMake(frame.origin.x, 0, frame.size.width, frame.size.height);
    btn.titleLabel.textAlignment = NSTextAlignmentCenter;
    [btn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateHighlighted];
    btn.titleLabel.font = [UIFont systemFontOfSize:12.0];
    
    btn.numberLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 5, frame.size.width, frame.size.height / 2)];
    btn.numberLabel.textAlignment = NSTextAlignmentCenter;
    btn.numberLabel.textColor = [UIColor blackColor];
    btn.numberLabel.font = [UIFont systemFontOfSize:15.0];
    [btn addSubview:btn.numberLabel];
    
    return btn;
}

- (CGRect)titleRectForContentRect:(CGRect)contentRect {
    return CGRectMake(contentRect.origin.x, 25, contentRect.size.width, contentRect.size.height / 2);
}


@end
