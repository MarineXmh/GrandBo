//
//  SignUpController.m
//  GrandBo
//
//  Created by Xu Menghua on 15/9/29.
//  Copyright © 2015年 Xu Menghua. All rights reserved.
//

#import "SignUpController.h"
#import "Token.h"
#import "CurrentUser.h"

@interface SignUpController ()

@end

@implementation SignUpController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    if (textField == self.passwordConfimeText) {
        [textField resignFirstResponder];
        [self signUp:nil];
    }
    
    if (textField == self.usernameText) {
        [self.emailText becomeFirstResponder];
        return YES;
    }
    
    if (textField == self.emailText) {
        [self.passwordText becomeFirstResponder];
        return YES;
    }
    
    if (textField == self.passwordText) {
        [self.passwordConfimeText becomeFirstResponder];
        return YES;
    }
    
    return YES;
}

- (IBAction)backgroundTouchDown:(UIControl *)sender {
    [self.usernameText resignFirstResponder];
    [self.passwordText resignFirstResponder];
    [self.passwordConfimeText resignFirstResponder];
    [self.emailText resignFirstResponder];
}

- (IBAction)signUp:(UIButton *)sender {
    if ([self.passwordText.text isEqualToString:self.passwordConfimeText.text] && self.usernameText.text != nil && self.emailText.text != nil && self.passwordText.text != nil){
        NSDictionary *data = [self syncSignUp];
        NSString *token = [data objectForKey:@"access_token"];
        NSString *currentUsername = [data objectForKey:@"current_user_name"];
        //NSLog(@"%@ %@", token, currentUsername);
        if(token != nil) {
            [Token saveToken:token];
            [CurrentUser saveCurrentUser:currentUsername];
            [self dismissViewControllerAnimated:YES completion:nil];
        }else {
            UIAlertView* dialogue = [[UIAlertView alloc]initWithTitle:nil message:@"发生错误" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
            [dialogue show];
        }
    }else {
        UIAlertView* dialogue = [[UIAlertView alloc]initWithTitle:nil message:@"请按要求填写信息" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [dialogue show];
    }
}

- (IBAction)cancel:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (NSURLRequest *) postSignUpRequest {
    NSString *urlString = @"http://vv.fuckjob.top/api/v1/signup";
    NSURL *url = [NSURL URLWithString:urlString];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url cachePolicy:NSURLRequestReloadIgnoringCacheData timeoutInterval:3.0];
    [request setHTTPMethod:@"post"];
    NSString *bodyString = [NSString stringWithFormat:@"email=%@&password=%@&password_confirmation=%@&name=%@", self.emailText.text, self.passwordText.text, self.passwordConfimeText.text, [self.usernameText.text stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    NSData *body = [bodyString dataUsingEncoding:NSUTF8StringEncoding];
    [request setHTTPBody:body];
    return request;
}

- (NSDictionary *)syncSignUp {
    NSURLRequest *request = [self postSignUpRequest];
    NSURLResponse *response = nil;
    NSError *error = nil;
    
    NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    if (error != nil) {
        //NSLog(@"%@", error.localizedDescription);
        return nil;
    }
    if (data != nil) {
        NSError *jsonError = nil;
        NSMutableDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&jsonError];
        //NSLog(@"%@",[[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding]);
        //NSLog(@"%@", array);
        return dict;
        
    }else {
        return nil;
    }
    return nil;
}

@end
