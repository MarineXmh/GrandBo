//
//  HomeTableViewCell.m
//  GrandBo
//
//  Created by Xu Menghua on 15/9/12.
//  Copyright (c) 2015年 Xu Menghua. All rights reserved.
//

#import "HomeTableViewCell.h"
#import "User.h"
#import "Status.h"
#import "HomeCellFrame.h"
#import "ImageViewWithCache.h"
#import "CellToolBar.h"
#import "CellToolBarButton.h"

@interface HomeTableViewCell ()

@property (nonatomic, strong) ImageViewWithCache *avatarImage;
@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UILabel *timeStampLabel;
@property (nonatomic, strong) UILabel *fromLabel;
@property (nonatomic, strong) UILabel *contentLabel;
@property (nonatomic, strong) CellToolBar *toolBar;

@end

@implementation HomeTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        ImageViewWithCache *avatarImage = [[ImageViewWithCache alloc]init];
        avatarImage.opaque = YES;
        [self.contentView addSubview:avatarImage];
        self.avatarImage = avatarImage;
        //NSLog(@"initAvatarImage");
        
        UILabel *nameLabel = [[UILabel alloc]init];
        nameLabel.opaque = YES;
        nameLabel.font = [UIFont systemFontOfSize:17.0];
        [self.contentView addSubview:nameLabel];
        self.nameLabel = nameLabel;
        
        UILabel *timeStampLabel = [[UILabel alloc]init];
        timeStampLabel.opaque = YES;
        timeStampLabel.font = [UIFont systemFontOfSize:10.0];
        [self.contentView addSubview:timeStampLabel];
        self.timeStampLabel = timeStampLabel;
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
        
        CellToolBar *toolBar = [[CellToolBar alloc]init];
        toolBar.opaque = YES;
        [self.contentView addSubview:toolBar];
        self.toolBar = toolBar;
    }
    //NSLog(@"initWithStyle");
    return self;
}

- (void)setCellFrame:(HomeCellFrame *)cellFrame {
    _cellFrame = cellFrame;
    [self settingData];
    [self settingFrame];
    [self settingToolbar];
    //NSLog(@"setCellFrame");
}

#pragma mark - 设置Data、Frame和ToolBar

- (void)settingData {
    Status *status = self.cellFrame.status;
    self.avatarImage.defaultImage = @"weibo_logo";
    self.avatarImage.imageURL = status.user.avatarURL;
    [self.nameLabel setText:status.user.name];
    [self.timeStampLabel setText:status.time];
    [self.fromLabel setText:@"来自巨博"];
    [self.contentLabel setText:status.content];
    //NSLog(@"setData");
}

- (void)settingFrame {
    self.avatarImage.frame = self.cellFrame.avatarFrame;
    self.nameLabel.frame = self.cellFrame.nameFrame;
    self.timeStampLabel.frame = self.cellFrame.timeFrame;
    self.fromLabel.frame = self.cellFrame.fromFrame;
    self.contentLabel.frame = self.cellFrame.contentFrame;
    self.toolBar.frame = self.cellFrame.toolBarFrame;
    //NSLog(@"setFrame");
    //NSLog(@"x=%f,y=%f,w=%f,h=%f",self.contentLabel.frame.origin.x, self.contentLabel.frame.origin.y, self.contentLabel.frame.size.width, self.contentLabel.frame.size.height);
}

- (void)settingToolbar {
    [self.toolBar.expand addTarget:self action:@selector(expandBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.toolBar.comment addTarget:self action:@selector(commentBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.toolBar.good addTarget:self action:@selector(goodBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)expandBtnClicked:(CellToolBarButton *)sender {
    if ([self.delegate respondsToSelector:@selector(didExpandBtnClicked:indexPath:)]) {
        [self.delegate didExpandBtnClicked:sender indexPath:self.indexPath];
    }
}

- (void)commentBtnClicked:(CellToolBarButton *)sender {
    if ([self.delegate respondsToSelector:@selector(didCommentBtnClicked:indexPath:)]) {
        [self.delegate didCommentBtnClicked:sender indexPath:self.indexPath];
    }
}

- (void)goodBtnClicked:(CellToolBarButton *)sender {
    if ([self.delegate respondsToSelector:@selector(didGoodBtnClicked:indexPath:)]) {
        [self.delegate didGoodBtnClicked:sender indexPath:self.indexPath];
    }
}

@end
