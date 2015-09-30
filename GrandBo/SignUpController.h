//
//  SignUpController.h
//  GrandBo
//
//  Created by Xu Menghua on 15/9/29.
//  Copyright © 2015年 Xu Menghua. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SignUpController : UIViewController <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *emailText;

@property (weak, nonatomic) IBOutlet UITextField *usernameText;

@property (weak, nonatomic) IBOutlet UITextField *passwordText;

@property (weak, nonatomic) IBOutlet UITextField *passwordConfimeText;

- (IBAction)signUp:(UIButton *)sender;

- (IBAction)cancel:(UIButton *)sender;

- (IBAction)backgroundTouchDown:(UIControl *)sender;

@end
