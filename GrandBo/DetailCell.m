//
//  DetailCell.m
//  GrandBo
//
//  Created by Xu Menghua on 15/10/3.
//  Copyright © 2015年 Xu Menghua. All rights reserved.
//

#import "DetailCell.h"
#import "ImageViewWithCache.h"
#import "Status.h"
#import "DetailStatusFrame.h"
#import "User.h"

@interface DetailCell()

@property (nonatomic, strong) ImageViewWithCache *avatarView;
@property (nonatomic, strong) UILabel *usernameLabel;
@property (nonatomic, strong) UILabel *timeLabel;
@property (nonatomic, strong) UILabel *fromLabel;
@property (nonatomic, strong) UILabel *contentLabel;

@end

@implementation DetailCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        ImageViewWithCache *avatarView = [[ImageViewWithCache alloc]init];
        avatarView.opaque = YES;
        [self.contentView addSubview:avatarView];
        self.avatarView = avatarView;
        //NSLog(@"initAvatarImage");
        
        UILabel *usernameLabel = [[UILabel alloc]init];
        usernameLabel.opaque = YES;
        usernameLabel.font = [UIFont systemFontOfSize:17.0];
        [self.contentView addSubview:usernameLabel];
        self.usernameLabel = usernameLabel;
        
        UILabel *timeLabel = [[UILabel alloc]init];
        timeLabel.opaque = YES;
        timeLabel.font = [UIFont systemFontOfSize:10.0];
        [self.contentView addSubview:timeLabel];
        self.timeLabel = timeLabel;
        //NSLog(@"initTimeStampLabel");
        
        UILabel *fromLabel = [[UILabel alloc]init];
        fromLabel.opaque = YES;
        fromLabel.font = [UIFont systemFontOfSize:10.0];
        [self.contentView addSubview:fromLabel];
        self.fromLabel = fromLabel;
        
        UILabel *contentLabel = [[UILabel alloc]init];
        contentLabel.opaque = YES;
        contentLabel.font = [UIFont systemFontOfSize:22.0];
        contentLabel.numberOfLines = 0;
        [self.contentView addSubview:contentLabel];
        self.contentLabel = contentLabel;
    }
    //NSLog(@"initWithStyle");
    return self;
}

- (void)setDetailFrame:(DetailStatusFrame *)detailFrame {
    _detailFrame = detailFrame;
    [self settingData];
    [self settingFrame];
}

#pragma mark - 设置Data和Frame

- (void)settingData {
    Status *status = self.detailFrame.status;
    self.avatarView.defaultImage = @"avatar_default_small";
    self.avatarView.imageURL = status.user.avatarURL;
    [self.usernameLabel setText:status.user.name];
    NSString *date = [status.time substringWithRange:NSMakeRange(0, 10)];
    NSString *time = [status.time substringWithRange:NSMakeRange(11, 5)];
    [self.timeLabel setText:[NSString stringWithFormat:@"%@ %@", date, time]];
    [self.fromLabel setText:@"来自巨博"];
    [self.contentLabel setText:status.content];
    //NSLog(@"%@", status.time);
}

- (void)settingFrame {
    self.avatarView.frame = self.detailFrame.avatarFrame;
    self.usernameLabel.frame = self.detailFrame.nameFrame;
    self.timeLabel.frame = self.detailFrame.timeFrame;
    self.fromLabel.frame = self.detailFrame.fromFrame;
    self.contentLabel.frame = self.detailFrame.contentFrame;
    //NSLog(@"setFrame");
    //NSLog(@"x=%f,y=%f,w=%f,h=%f",self.contentLabel.frame.origin.x, self.contentLabel.frame.origin.y,
}

@end
