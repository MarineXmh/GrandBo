//
//  CommentController.h
//  GrandBo
//
//  Created by Xu Menghua on 15/9/21.
//  Copyright © 2015年 Xu Menghua. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Status;

@interface CommentController : UIViewController <UITextViewDelegate>

@property (nonatomic, strong) NSString *token;
@property (nonatomic, strong) Status *status;
@property (weak, nonatomic) IBOutlet UITextView *contentView;
@property (weak, nonatomic) IBOutlet UISwitch *commentWithExpand;

- (IBAction)sendComment:(UIBarButtonItem *)sender;
- (IBAction)cancel:(UIBarButtonItem *)sender;

@end
