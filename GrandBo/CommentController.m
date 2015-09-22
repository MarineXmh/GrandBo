//
//  CommentController.m
//  GrandBo
//
//  Created by Xu Menghua on 15/9/21.
//  Copyright © 2015年 Xu Menghua. All rights reserved.
//

#import "CommentController.h"
#import "Token.h"
#import "Status.h"

@interface CommentController ()

@end

@implementation CommentController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _token = [Token loadToken];
}

- (void)viewDidDisappear:(BOOL)animated {
    
}

#pragma mark - 事件处理

- (IBAction)cancel:(UIBarButtonItem *)sender {
    [_contentView resignFirstResponder];
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)sendComment:(UIBarButtonItem *)sender {
    NSURLRequest *request = [self postRequest];
    NSOperationQueue *queue = [[NSOperationQueue alloc]init];
    queue.maxConcurrentOperationCount = 2;
    [NSURLConnection sendAsynchronousRequest:request queue:queue completionHandler:^(NSURLResponse * _Nullable response, NSData * _Nullable data, NSError * _Nullable connectionError) {
        if (connectionError != nil) {
            UIAlertView* dialogue = [[UIAlertView alloc]initWithTitle:nil message:@"发送失败" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
            [dialogue show];
        }
        NSLog(@"%@", [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding]);
    }];
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}

//构造post请求
- (NSURLRequest *) postRequest {
    //NSLog(@"%d", self.status.id);
    NSString *urlString = [[NSString alloc]initWithFormat:@"http://vv.fuckjob.top/api/v1/microposts/%@/comments", self.status.id];
    NSLog(@"%@", urlString);
    
    NSURL *url = [NSURL URLWithString:urlString];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url cachePolicy:NSURLRequestReloadIgnoringCacheData timeoutInterval:3.0];
    [request setHTTPMethod:@"post"];
    NSString *bodyString = [NSString stringWithFormat:@"access_token=%@&content=%@", self.token, self.contentView.text];
    NSData *body = [bodyString dataUsingEncoding:NSUTF8StringEncoding];
    [request setHTTPBody:body];
    return request;
}

//第一次开始编辑清空textView内容
- (BOOL)textViewShouldBeginEditing:(UITextView *)textView {
    if([textView.text isEqualToString:@"写评论..."]) {
        textView.text = nil;
        //NSLog(@"%@", textView.text);
    }
    return YES;
}

//监听键盘返回键，点击收起键盘
- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {
    if([text isEqualToString:@"\n"]) {
        [textView resignFirstResponder];
    }
    return YES;
}

@end
