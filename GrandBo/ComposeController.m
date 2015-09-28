//
//  ComposeController.m
//  GrandBo
//
//  Created by Xu Menghua on 15/9/3.
//  Copyright (c) 2015年 Xu Menghua. All rights reserved.
//
#define kComposeButtonWidth 71
#define kComposeButtonHeight 88
#define kFirstRowY 267
#define kSecondRowY 383
#define kFirstColumnX 16
#define kSecondColumnX 125
#define kThirdColumnX 233

#import "ComposeController.h"
#import "ComposeButton.h"
#import "Token.h"

@interface ComposeController ()

@end

@implementation ComposeController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.ideaBtn = [ComposeButton initComposeButtonwithTitle:@"文字" image:@"tabbar_compose_idea" Frame:CGRectMake(0, 0, kComposeButtonWidth, kComposeButtonHeight)];
    [self.view addSubview:self.ideaBtn];
    
    self.photoBtn = [ComposeButton initComposeButtonwithTitle:@"相册" image:@"tabbar_compose_photo" Frame:CGRectMake(kSecondColumnX, 0, kComposeButtonWidth, kComposeButtonHeight)];
    [self.view addSubview:self.photoBtn];
    
    self.cameraBtn = [ComposeButton initComposeButtonwithTitle:@"拍摄" image:@"tabbar_compose_camera" Frame:CGRectMake(320, 0, kComposeButtonWidth, kComposeButtonHeight)];
    [self.view addSubview:self.cameraBtn];
    
    self.lbsBtn = [ComposeButton initComposeButtonwithTitle:@"签到" image:@"tabbar_compose_lbs" Frame:CGRectMake(0, 568, kComposeButtonWidth, kComposeButtonHeight)];
    [self.view addSubview:self.lbsBtn];
    
    self.reviewBtn = [ComposeButton initComposeButtonwithTitle:@"点评" image:@"tabbar_compose_review" Frame:CGRectMake(kSecondColumnX, 568, kComposeButtonWidth, kComposeButtonHeight)];
    [self.view addSubview:self.reviewBtn];
    
    self.moreBtn = [ComposeButton initComposeButtonwithTitle:@"更多" image:@"tabbar_compose_more" Frame:CGRectMake(320, 568, kComposeButtonWidth, kComposeButtonHeight)];
    [self.view addSubview:self.moreBtn];
    
    [self.ideaBtn addTarget:self action:@selector(ideaBtnClick) forControlEvents:UIControlEventTouchUpInside];
    
    UIImageView *backGround = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"compose_background"]];
    backGround.frame = CGRectMake(0, 20, 320, 500);
    [self.view addSubview:backGround];
    [self.view sendSubviewToBack:backGround];
    
    // Do any additional setup after loading the view.
}

- (void)viewDidAppear:(BOOL)animated {
    [UIView animateWithDuration:0.5 animations:^{
        self.ideaBtn.frame = CGRectMake(kFirstColumnX, kFirstRowY, kComposeButtonWidth, kComposeButtonHeight);
        self.photoBtn.frame = CGRectMake(kSecondColumnX, kFirstRowY, kComposeButtonWidth, kComposeButtonHeight);
        self.cameraBtn.frame = CGRectMake(kThirdColumnX, kFirstRowY, kComposeButtonWidth, kComposeButtonHeight);
        self.lbsBtn.frame = CGRectMake(kFirstColumnX, kSecondRowY, kComposeButtonWidth, kComposeButtonHeight);
        self.reviewBtn.frame = CGRectMake(kSecondColumnX, kSecondRowY, kComposeButtonWidth, kComposeButtonHeight);
        self.moreBtn.frame = CGRectMake(kThirdColumnX, kSecondRowY, kComposeButtonWidth, kComposeButtonHeight);
    }];
}

- (void)viewDidDisappear:(BOOL)animated {
    self.ideaBtn.frame = CGRectMake(0, 0, kComposeButtonWidth, kComposeButtonHeight);
    self.photoBtn.frame = CGRectMake(kSecondColumnX, 0, kComposeButtonWidth, kComposeButtonHeight);
    self.cameraBtn.frame = CGRectMake(320, 0, kComposeButtonWidth, kComposeButtonHeight);
    self.lbsBtn.frame = CGRectMake(0, 568, kComposeButtonWidth, kComposeButtonHeight);
    self.reviewBtn.frame = CGRectMake(kSecondColumnX, 568, kComposeButtonWidth, kComposeButtonHeight);
    self.moreBtn.frame = CGRectMake(320, 568, kComposeButtonWidth, kComposeButtonHeight);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma -监听按钮点击

- (void)ideaBtnClick {
    [self performSegueWithIdentifier:@"Idea" sender:nil];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
