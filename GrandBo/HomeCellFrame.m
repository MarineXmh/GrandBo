//
//  HomeCellFrame.m
//  GrandBo
//
//  Created by Xu Menghua on 15/9/15.
//  Copyright (c) 2015年 Xu Menghua. All rights reserved.
//

#import "HomeCellFrame.h"
#import "Status.h"
#import "User.h"

@implementation HomeCellFrame

- (void)setStatus:(Status *)status {
    _status = status;
    
    CGFloat padding = 10;
    
    CGFloat avatarViewX = padding;
    CGFloat avatarViewY = padding;
    CGFloat avatarViewW = 50;
    CGFloat avatarViewH = 50;
    self.avatarFrame = CGRectMake(avatarViewX, avatarViewY, avatarViewW, avatarViewH);
    
    CGFloat nameViewX = CGRectGetMaxX(self.avatarFrame) + padding;
    CGSize nameSize = [self sizeWithString:status.user.name font:[UIFont systemFontOfSize:17.0] maxSize:CGSizeMake(MAXFLOAT, MAXFLOAT)];
    CGFloat nameViewW = nameSize.width;
    CGFloat nameViewH = nameSize.height;
    CGFloat nameViewY = avatarViewY + 8;
    self.nameFrame = CGRectMake(nameViewX, nameViewY, nameViewW, nameViewH);
    
    CGFloat timeViewX = nameViewX;
    CGFloat timeViewY = CGRectGetMaxY(self.avatarFrame) - 12;
    CGSize timeSize = [self sizeWithString:status.time font:[UIFont systemFontOfSize:10.0] maxSize:CGSizeMake(MAXFLOAT, MAXFLOAT)];
    CGFloat timeViewW = timeSize.width;
    CGFloat timeViewH = timeSize.height;
    self.timeFrame = CGRectMake(timeViewX, timeViewY, timeViewW, timeViewH);
    
    CGFloat fromViewX = timeViewX + timeViewW + padding;
    CGFloat fromViewY = timeViewY;
    CGSize fromSize = [self sizeWithString:@"来自巨博"font:[UIFont systemFontOfSize:10.0] maxSize:CGSizeMake(MAXFLOAT, MAXFLOAT)];
    CGFloat fromViewW = fromSize.width;
    CGFloat fromViewH = fromSize.height;
    self.fromFrame = CGRectMake(fromViewX, fromViewY, fromViewW, fromViewH);
    
    CGFloat contentViewX = avatarViewX;
    CGFloat contentViewY = CGRectGetMaxY(self.avatarFrame) + padding;
    CGSize contentSize = [self sizeWithString:status.content font:[UIFont systemFontOfSize:22.0] maxSize:CGSizeMake(320, MAXFLOAT)];
    CGFloat contentViewW = contentSize.width;
    CGFloat contentViewH = contentSize.height;
    self.contentFrame = CGRectMake(contentViewX, contentViewY, contentViewW, contentViewH);
    //NSLog(@"%f %f", contentViewW, contentViewH);

    self.cellHeight = CGRectGetMaxY(self.contentFrame) + padding;
    
    //NSLog(@"--SetFrame--%f", self.cellHeight);
}

#pragma mark - 根据字符动态计算UILabel大小

- (CGSize)sizeWithString:(NSString *)string font:(UIFont *)font maxSize:(CGSize)maxSize {
    NSDictionary *dict = @{NSFontAttributeName : font};
    CGSize size = [string boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:dict context:nil].size;
    return size;
}

@end
