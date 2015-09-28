//
//  UserCell.h
//  GrandBo
//
//  Created by Xu Menghua on 15/9/23.
//  Copyright © 2015年 Xu Menghua. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ProfileToolBar;
@class ImageViewWithCache;
@class User;

@interface UserCell : UITableViewCell

@property (nonatomic, strong) ImageViewWithCache *avatar;
@property (nonatomic, strong) UILabel *usernameLabel;
@property (nonatomic, strong) UILabel *bioLabel;
@property (nonatomic, strong) ProfileToolBar *toolBar;

- (void)settingData:(User *)currentUser;

@end
