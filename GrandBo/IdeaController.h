//
//  IdeaController.h
//  GrandBo
//
//  Created by Xu Menghua on 15/9/4.
//  Copyright (c) 2015年 Xu Menghua. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface IdeaController : UIViewController <UITextViewDelegate>

- (IBAction)cancel:(UIBarButtonItem *)sender;
- (IBAction)sendPost:(UIBarButtonItem *)sender;
@property (weak, nonatomic) IBOutlet UITextView *contentText;
@property (weak, nonatomic) IBOutlet UIToolbar *footerBar;


@end
