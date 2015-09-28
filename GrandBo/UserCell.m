//
//  UserCell.m
//  GrandBo
//
//  Created by Xu Menghua on 15/9/23.
//  Copyright © 2015年 Xu Menghua. All rights reserved.
//

#import "UserCell.h"
#import "ProfileToolBarButton.h"
#import "ProfileToolBar.h"
#import "ImageViewWithCache.h"
#import "User.h"

@implementation UserCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    CGRect avatarFrame = CGRectMake(10, 15, 40, 40);
    ImageViewWithCache *avatar = [[ImageViewWithCache alloc]initWithFrame:avatarFrame];
    [self.contentView addSubview:avatar];
    self.avatar = avatar;
    
    CGRect usernameFrame = CGRectMake(60, 20, 250, 16);
    UILabel *usernameLabel = [[UILabel alloc]initWithFrame:usernameFrame];
    usernameLabel.font = [UIFont systemFontOfSize:16.0];
    usernameLabel.textColor = [UIColor blackColor];
    [self.contentView addSubview:usernameLabel];
    self.usernameLabel = usernameLabel;
    
    CGRect bioFrame = CGRectMake(60, 40, 250, 12);
    UILabel *bioLabel = [[UILabel alloc]initWithFrame:bioFrame];
    bioLabel.font = [UIFont systemFontOfSize:12.0];
    bioLabel.textColor = [UIColor grayColor];
    [self.contentView addSubview:bioLabel];
    self.bioLabel = bioLabel;
    
    ProfileToolBar *toolBar = [[ProfileToolBar alloc]initWithFrame:CGRectMake(0, 60, 320, 50)];
    [self.contentView addSubview:toolBar];
    self.toolBar = toolBar;
    
    self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    return self;
}

- (void)settingData:(User *)currentUser {
    self.avatar.defaultImage = @"avatar_default_small";
    self.avatar.imageURL = currentUser.avatarURL;
    self.usernameLabel.text = currentUser.name;
    self.bioLabel.text = @"简介：暂无介绍";
    self.toolBar.status.numberLabel.text = [NSString stringWithFormat:@"%d", currentUser.micropostsCount];
    self.toolBar.followed.numberLabel.text = [NSString stringWithFormat:@"%d", currentUser.followingCount];
    self.toolBar.fans.numberLabel.text = [NSString stringWithFormat:@"%d", currentUser.followersCount];
}



@end
