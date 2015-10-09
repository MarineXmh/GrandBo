//
//  CommentFrame.m
//  GrandBo
//
//  Created by Xu Menghua on 15/10/3.
//  Copyright © 2015年 Xu Menghua. All rights reserved.
//

#import "CommentFrame.h"
#import "Comment.h"
#import "User.h"

@implementation CommentFrame

- (void)setComment:(Comment *)comment {
    _comment = comment;
    
    CGFloat padding = 10;
    
    CGFloat avatarViewX = padding;
    CGFloat avatarViewY = padding;
    CGFloat avatarViewW = 50;
    CGFloat avatarViewH = 50;
    self.avatarFrame = CGRectMake(avatarViewX, avatarViewY, avatarViewW, avatarViewH);
    
    CGFloat nameViewX = CGRectGetMaxX(self.avatarFrame) + padding;
    CGSize nameSize = [self sizeWithString:comment.user.name font:[UIFont systemFontOfSize:17.0] maxSize:CGSizeMake(MAXFLOAT, MAXFLOAT)];
    CGFloat nameViewW = nameSize.width;
    CGFloat nameViewH = nameSize.height;
    CGFloat nameViewY = avatarViewY + 8;
    self.nameFrame = CGRectMake(nameViewX, nameViewY, nameViewW, nameViewH);
    
    CGFloat timeViewX = nameViewX;
    CGFloat timeViewY = CGRectGetMaxY(self.avatarFrame) - 12;
    CGSize timeSize = [self sizeWithString:@"0000-00-00 00:00" font:[UIFont systemFontOfSize:10.0] maxSize:CGSizeMake(MAXFLOAT, MAXFLOAT)];
    CGFloat timeViewW = timeSize.width;
    CGFloat timeViewH = timeSize.height;
    self.timeFrame = CGRectMake(timeViewX, timeViewY, timeViewW, timeViewH);
    
    CGFloat contentViewX = avatarViewX;
    CGFloat contentViewY = CGRectGetMaxY(self.avatarFrame) + padding;
    CGSize contentSize = [self sizeWithString:comment.content font:[UIFont systemFontOfSize:22.0] maxSize:CGSizeMake(300, MAXFLOAT)];
    CGFloat contentViewW = contentSize.width;
    CGFloat contentViewH = contentSize.height;
    self.contentFrame = CGRectMake(contentViewX, contentViewY, contentViewW, contentViewH);
    //NSLog(@"%f %f", contentViewW, contentViewH);
    
    self.cellHeight = CGRectGetMaxY(self.contentFrame) + padding;
}

#pragma mark - 根据字符动态计算UILabel大小

- (CGSize)sizeWithString:(NSString *)string font:(UIFont *)font maxSize:(CGSize)maxSize {
    NSDictionary *dict = @{NSFontAttributeName : font};
    CGSize size = [string boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:dict context:nil].size;
    return size;
}


@end
