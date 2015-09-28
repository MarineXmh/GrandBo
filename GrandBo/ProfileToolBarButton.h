//
//  ProfileToolBarButton.h
//  GrandBo
//
//  Created by Xu Menghua on 15/9/23.
//  Copyright © 2015年 Xu Menghua. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProfileToolBarButton : UIButton

@property (nonatomic, strong) UILabel *numberLabel;

+ (ProfileToolBarButton *)initButtonWithFrame:(CGRect)frame;

@end
