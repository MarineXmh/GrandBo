//
//  IdeaController.m
//  GrandBo
//
//  Created by Xu Menghua on 15/9/4.
//  Copyright (c) 2015年 Xu Menghua. All rights reserved.
//

#import "IdeaController.h"
#import "Token.h"

@interface IdeaController()

@property (nonatomic, strong) NSString *token;

@end

@implementation IdeaController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.token = [Token loadToken];
    
    //[self registerForKeyboardNotifications];
}

- (void)viewDidDisappear:(BOOL)animated {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)viewDidAppear:(BOOL)animated {
    [self.contentText becomeFirstResponder];
}

#pragma mark - 事件处理

- (IBAction)cancel:(UIBarButtonItem *)sender {
    [self.contentText resignFirstResponder];
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)sendPost:(UIBarButtonItem *)sender {
    NSURLRequest *request = [self postRequest];
    NSOperationQueue *queue = [[NSOperationQueue alloc]init];
    queue.maxConcurrentOperationCount = 2;
    [NSURLConnection sendAsynchronousRequest:request queue:queue completionHandler:^(NSURLResponse * _Nullable response, NSData * _Nullable data, NSError * _Nullable connectionError) {
        if (connectionError != nil) {
            UIAlertView* dialogue = [[UIAlertView alloc]initWithTitle:nil message:@"发送失败" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
            [dialogue show];
        }
    }];
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}

//构造post请求
- (NSURLRequest *) postRequest {
    NSString *urlString = @"http://vv.fuckjob.top/api/v1/microposts";
    NSURL *url = [NSURL URLWithString:urlString];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url cachePolicy:NSURLRequestReloadIgnoringCacheData timeoutInterval:3.0];
    [request setHTTPMethod:@"post"];
    NSString *bodyString = [NSString stringWithFormat:@"access_token=%@&content=%@", _token, _contentText.text];
    NSData *body = [bodyString dataUsingEncoding:NSUTF8StringEncoding];
    [request setHTTPBody:body];
    return request;
}

//监听键盘返回键，点击收起键盘
- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {
    if([text isEqualToString:@"\n"]) {
        [textView resignFirstResponder];
    }
    if([textView.text isEqualToString:@"分享新鲜事..."]) {
        textView.text = nil;
        //NSLog(@"%@", textView.text);
    }
    return YES;
}

#pragma mark - 使footerBar动态随键盘移动

- (BOOL)textViewShouldBeginEditing:(UITextView *)textView {
    [UIView animateWithDuration:0.25 animations:^{
        CGRect contentViewFrame = CGRectMake(0, 64, 320, 460 - 252);
        self.contentText.frame = contentViewFrame;
        
        CGRect footerBarFrame = CGRectMake(0, 524 - 252, 320, 44);
        self.footerBar.frame = footerBarFrame;
    }];
    return YES;
}

- (BOOL)textViewShouldEndEditing:(UITextView *)textView {
    [UIView animateWithDuration:0.25 animations:^{
        CGRect footerBarFrame = CGRectMake(0, 524, 320, 44);
        self.footerBar.frame = footerBarFrame;
        
        CGRect contentViewFrame = CGRectMake(0, 64, 320, 460);
        self.contentText.frame = contentViewFrame;
    }];
    return YES;
}

/*
- (void) registerForKeyboardNotifications
{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWasShown:) name:UIKeyboardDidShowNotification object:nil];
    
    [[NSNotificationCenter defaultCenter]  addObserver:self selector:@selector(keyboardWasHidden:) name:UIKeyboardDidHideNotification object:nil];
}

- (void) keyboardWasShown:(NSNotification *) notif
{
    //NSDictionary *info = [notif userInfo];
    
    //NSValue *value = [info objectForKey:UIKeyboardFrameBeginUserInfoKey];
    //CGSize keyboardSize = [value CGRectValue].size;
    //NSLog(@"%f", keyboardSize.height);
    
    [UIView animateWithDuration:0.2 animations:^{
        CGRect contentViewFrame = CGRectMake(0, 64, 320, 460 - 252);
        self.contentText.frame = contentViewFrame;
        
        CGRect footerBarFrame = CGRectMake(0, 524 - 252, 320, 44);
        self.footerBar.frame = footerBarFrame;
    }];
    
    //NSLog(@"x=%f,y=%f,w=%f,h=%f", _footerBar.frame.origin.x, _footerBar.frame.origin.y, _footerBar.frame.size.width, _footerBar.frame.size.height);
    //NSLog(@"keyBoard:%f", keyboardSize.height);
}
- (void) keyboardWasHidden:(NSNotification *) notif
{
    //NSDictionary *info = [notif userInfo];
    
    //NSValue *value = [info objectForKey:UIKeyboardFrameBeginUserInfoKey];
    //CGSize keyboardSize = [value CGRectValue].size;
    
    [UIView animateWithDuration:0.2 animations:^{
        CGRect footerBarFrame = CGRectMake(0, 524, 320, 44);
        self.footerBar.frame = footerBarFrame;
        
        CGRect contentViewFrame = CGRectMake(0, 64, 320, 460);
        self.contentText.frame = contentViewFrame;
    }];
    
    
    //NSLog(@"x=%f,y=%f,w=%f,h=%f", _footerBar.frame.origin.x, _footerBar.frame.origin.y, _footerBar.frame.size.width, _footerBar.frame.size.height);
    //NSLog(@"keyboardWasHidden keyBoard:%f", keyboardSize.height);
}
*/

@end
