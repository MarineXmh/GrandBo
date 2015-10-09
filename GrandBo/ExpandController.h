//
//  ExpandController.h
//  GrandBo
//
//  Created by Xu Menghua on 15/10/1.
//  Copyright © 2015年 Xu Menghua. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Status;
@class ImageViewWithCache;

@interface ExpandController : UIViewController <UITextViewDelegate>

@property (nonatomic, strong) Status *status;
@property (nonatomic, strong) NSString *token;

@property (weak, nonatomic) IBOutlet UILabel *username;
@property (weak, nonatomic) IBOutlet UILabel *statusContent;
@property (weak, nonatomic) IBOutlet ImageViewWithCache *avatar;
@property (weak, nonatomic) IBOutlet UITextView *content;
@property (weak, nonatomic) IBOutlet UISwitch *expandWithComment;

- (IBAction)cancel:(UIBarButtonItem *)sender;
- (IBAction)send:(UIBarButtonItem *)sender;


@end
