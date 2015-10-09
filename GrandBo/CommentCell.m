//
//  CommentCell.m
//  GrandBo
//
//  Created by Xu Menghua on 15/10/3.
//  Copyright © 2015年 Xu Menghua. All rights reserved.
//

#import "CommentCell.h"
#import "ImageViewWithCache.h"
#import "User.h"
#import "Comment.h"
#import "CommentFrame.h"

@interface CommentCell()

@property (nonatomic, strong) ImageViewWithCache *avatarView;
@property (nonatomic, strong) UILabel *usernameLabel;
@property (nonatomic, strong) UILabel *timeLabel;
@property (nonatomic, strong) UILabel *contentLabel;

@end

@implementation CommentCell

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

- (void)setCommentFrame:(CommentFrame *)commentFrame {
    _commentFrame = commentFrame;
    [self settingData];
    [self settingFrame];
}

#pragma mark - 设置Data和Frame

- (void)settingData {
    Comment *comment = self.commentFrame.comment;
    self.avatarView.defaultImage = @"avatar_default_small";
    self.avatarView.imageURL = comment.user.avatarURL;
    [self.usernameLabel setText:comment.user.name];
    NSString *date = [comment.time substringWithRange:NSMakeRange(0, 10)];
    NSString *time = [comment.time substringWithRange:NSMakeRange(11, 5)];
    [self.timeLabel setText:[NSString stringWithFormat:@"%@ %@", date, time]];
    [self.contentLabel setText:comment.content];
    //NSLog(@"%@", status.time);
}

- (void)settingFrame {
    self.avatarView.frame = self.commentFrame.avatarFrame;
    self.usernameLabel.frame = self.commentFrame.nameFrame;
    self.timeLabel.frame = self.commentFrame.timeFrame;
    self.contentLabel.frame = self.commentFrame.contentFrame;
    //NSLog(@"setFrame");
    //NSLog(@"x=%f,y=%f,w=%f,h=%f",self.contentLabel.frame.origin.x, self.contentLabel.frame.origin.y,
}

@end
