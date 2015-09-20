//
//  LoginController.h
//  GrandBo
//
//  Created by Xu Menghua on 15/9/5.
//  Copyright (c) 2015年 Xu Menghua. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginController : UIViewController <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *userText;
@property (weak, nonatomic) IBOutlet UITextField *passwordText;

- (IBAction)login:(UIButton *)sender;
- (IBAction)register:(UIButton *)sender;
- (IBAction)userChanged:(UITextField *)sender;
- (IBAction)passwordChanged:(UITextField *)sender;
- (IBAction)backgroundTouchDown:(UIControl *)sender;

- (NSString *)loadToken;

@end
