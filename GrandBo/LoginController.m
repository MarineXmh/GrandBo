//
//  LoginController.m
//  GrandBo
//
//  Created by Xu Menghua on 15/9/5.
//  Copyright (c) 2015年 Xu Menghua. All rights reserved.
//

#import "LoginController.h"

@interface LoginController ()

@end

@implementation LoginController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidAppear:(BOOL)animated {
    /*
    NSString *savedToken = [self loadToken];
    //UIAlertView* dialogue = [[UIAlertView alloc]initWithTitle:nil message:[NSString stringWithFormat:@"%@", savedToken] delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
    //[dialogue show];
    if(savedToken != nil) {
        [self performSegueWithIdentifier:@"Home" sender:savedToken];
    }
    */
}

#pragma mark - prepareForSegue

// In a storyboard-based application, you will often want to do a little preparation before navigation
/*
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(NSString *)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    UIViewController *destination = [segue destinationViewController];
    [destination setValue:sender forKey:@"token"];
}
*/

#pragma mark - 事件处理

- (IBAction)login:(UIButton *)sender {
    NSString *token = [self syncLogin];
    if(token != nil) {
        [self saveToken:token];
        [self dismissViewControllerAnimated:YES completion:^{
            [[self parentViewController] setValue:_userText.text forKeyPath:@"usernameTitle.title"];
        }];
    }else {
        UIAlertView* dialogue = [[UIAlertView alloc]initWithTitle:nil message:@"用户名或密码错误" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [dialogue show];
    }
    //NSLog(@"%@-----%@", token, [self loadToken]);
}

- (IBAction)register:(UIButton *)sender {
}

- (IBAction)userChanged:(UITextField *)sender {
    UIImageView *image = (UIImageView *)[self.view viewWithTag:1];
    if (sender.text == nil) {
        image.highlighted = NO;
    }else {
        image.highlighted = YES;
    }
}

- (IBAction)passwordChanged:(UITextField *)sender {
    UIImageView *image = (UIImageView *)[self.view viewWithTag:2];
    if (sender.text == nil) {
        image.highlighted = NO;
        //NSLog(@"%@", sender.text);
    }else {
        image.highlighted = YES;
        //NSLog(@"%@", sender.text);
    }
}

#pragma mark - 键盘处理

- (IBAction)backgroundTouchDown:(UIControl *)sender {
    [_userText resignFirstResponder];
    [_passwordText  resignFirstResponder];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    if (textField == _passwordText) {
        [self login:nil];
    }
    if (textField == _userText) {
        [_passwordText becomeFirstResponder];
        return YES;
    }
    [textField resignFirstResponder];
    return YES;
}

#pragma mark - 登录方法

- (NSString *)syncLogin {
    NSURLRequest *request = [self postLoginRequest];
    NSError *error = nil;
    NSURLResponse *response = nil;
    NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    
    if (error != nil) {
        //NSLog(@"%@", error.localizedDescription);
        return nil;
    }
    if (data != nil) {
        NSError *jsonError = nil;
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&jsonError];
        NSString *token = [dict objectForKey:@"access_token"];
        //NSLog(@"%@",token);
        return token;
        
    }else {
        return nil;
    }
}

- (NSURLRequest *) postLoginRequest {
    NSString *urlString = @"http://vv.fuckjob.top/api/v1/login";
    NSURL *url = [NSURL URLWithString:urlString];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url cachePolicy:NSURLRequestReloadIgnoringCacheData timeoutInterval:3.0];
    [request setHTTPMethod:@"post"];
    NSString *bodyString = [NSString stringWithFormat:@"email=%@&password=%@", _userText.text, _passwordText.text];
    NSData *body = [bodyString dataUsingEncoding:NSUTF8StringEncoding];
    [request setHTTPBody:body];
    return request;
}

#pragma mark - 存读Token

- (BOOL)saveToken:(NSString *)token {
    NSString *path = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0]stringByAppendingPathComponent:@"token.txt"];
    NSError *error = nil;
    [token writeToFile:path atomically:YES encoding:NSUTF8StringEncoding error:&error];
    return YES;
}

- (NSString *)loadToken {
    NSString *path = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0]stringByAppendingPathComponent:@"token.txt"];
    NSError *error = nil;
    NSString *token = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:&error];
    return token;
}

@end
