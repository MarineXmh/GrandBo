//
//  ProfileToolBar.m
//  GrandBo
//
//  Created by Xu Menghua on 15/9/23.
//  Copyright © 2015年 Xu Menghua. All rights reserved.
//

#import "ProfileToolBar.h"
#import "ProfileToolBarButton.h"

@implementation ProfileToolBar

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    CGRect statusFrame = CGRectMake(frame.origin.x, frame.origin.y, frame.size.width / 3, frame.size.height);
    self.status = [ProfileToolBarButton initButtonWithFrame:statusFrame];
    [self.status setTitle:@"巨博" forState:UIControlStateNormal];
    [self addSubview:self.status];
    
    CGRect followedFrame = CGRectMake(statusFrame.origin.x + statusFrame.size.width, frame.origin.y, statusFrame.size.width, statusFrame.size.height);
    self.followed = [ProfileToolBarButton initButtonWithFrame:followedFrame];
    [self.followed setTitle:@"关注" forState:UIControlStateNormal];
    [self addSubview:self.followed];
    
    CGRect fansFrame = CGRectMake(followedFrame.origin.x + followedFrame.size.width, frame.origin.y, followedFrame.size.width, followedFrame.size.height);
    self.fans = [ProfileToolBarButton initButtonWithFrame:fansFrame];
    [self.fans setTitle:@"粉丝" forState:UIControlStateNormal];
    [self addSubview:self.fans];
    
    return self;
}

- (void)settingStatusNumber:(int)statusNumber followedNumber:(int)followedNumber fansNumber:(int)fansNumber {
    self.status.numberLabel.text = [NSString stringWithFormat:@"%d", statusNumber];
    self.followed.numberLabel.text = [NSString stringWithFormat:@"%d", followedNumber];
    self.fans.numberLabel.text = [NSString stringWithFormat:@"%d", fansNumber];
}

@end
