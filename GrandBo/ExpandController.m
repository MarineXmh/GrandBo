//
//  ExpandController.m
//  GrandBo
//
//  Created by Xu Menghua on 15/10/1.
//  Copyright © 2015年 Xu Menghua. All rights reserved.
//

#import "ExpandController.h"
#import "Status.h"
#import "User.h"
#import "ImageViewWithCache.h"
#import "Token.h"

@interface ExpandController ()

@end

@implementation ExpandController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.token = [Token loadToken];
    
    self.username.text = self.status.user.name;
    self.statusContent.text = self.status.content;
    self.avatar.defaultImage = @"avatar_default";
    self.avatar.imageURL = self.status.user.avatarURL;
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidAppear:(BOOL)animated {
    [self.content becomeFirstResponder];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)cancel:(UIBarButtonItem *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)send:(UIBarButtonItem *)sender {
    NSURLRequest *request = [self postRequest];
    NSOperationQueue *queue = [[NSOperationQueue alloc]init];
    queue.maxConcurrentOperationCount = 2;
    [NSURLConnection sendAsynchronousRequest:request queue:queue completionHandler:^(NSURLResponse * _Nullable response, NSData * _Nullable data, NSError * _Nullable connectionError) {
        if (connectionError != nil) {
            UIAlertView* dialogue = [[UIAlertView alloc]initWithTitle:nil message:@"发送失败" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
            [dialogue show];
        }
        //NSLog(@"%@", [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding]);
    }];
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {
    if([textView.text isEqualToString:@"说说分享心得..."]) {
        textView.text = nil;
    }
    
    return YES;
}

//构造post请求
- (NSURLRequest *) postRequest {
    //NSLog(@"%d", self.status.id);
    NSString *urlString = [[NSString alloc]initWithFormat:@"http://vv.fuckjob.top/api/v1/microposts/%d/expands", self.status.id];
    //NSLog(@"%@", urlString);
    
    NSURL *url = [NSURL URLWithString:urlString];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url cachePolicy:NSURLRequestReloadIgnoringCacheData timeoutInterval:3.0];
    [request setHTTPMethod:@"post"];
    NSString *bodyString = [NSString stringWithFormat:@"access_token=%@&content=%@", self.token, self.content.text];
    if ([self.expandWithComment isOn]) {
        bodyString = [NSString stringWithFormat:@"access_token=%@&content=%@&same_time_comment=%d", self.token, self.content.text, [self.expandWithComment isOn]];
    }
    NSData *body = [bodyString dataUsingEncoding:NSUTF8StringEncoding];
    [request setHTTPBody:body];
    return request;
}

@end
