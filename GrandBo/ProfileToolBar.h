//
//  ProfileToolBar.h
//  GrandBo
//
//  Created by Xu Menghua on 15/9/23.
//  Copyright © 2015年 Xu Menghua. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ProfileToolBarButton;

@interface ProfileToolBar : UIView

@property (nonatomic, strong) ProfileToolBarButton *status;
@property (nonatomic, strong) ProfileToolBarButton *followed;
@property (nonatomic, strong) ProfileToolBarButton *fans;

- (void)settingStatusNumber:(int)statusNumber followedNumber:(int)followedNumber fansNumber:(int)fansNumber;

@end
