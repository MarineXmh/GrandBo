//
//  MessageCell.m
//  GrandBo
//
//  Created by Xu Menghua on 15/9/23.
//  Copyright © 2015年 Xu Menghua. All rights reserved.
//

#import "MessageCell.h"

@implementation MessageCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setTextAndImage:(NSString *)text image:(NSString *)image {
    [self.textLabel setText:text];
    self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    [self.imageView setImage:[UIImage imageNamed:image]];
}

@end
