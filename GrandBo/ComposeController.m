//
//  ComposeController.m
//  GrandBo
//
//  Created by Xu Menghua on 15/9/3.
//  Copyright (c) 2015年 Xu Menghua. All rights reserved.
//
#define kComposeButtonWidth 71
#define kComposeButtonHeight 88
#define kFirstRowY 227
#define kSecondRowY 343
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
    
    [self addComposeButtonwithTitle:@"文字" image:@"tabbar_compose_idea" Frame:CGRectMake(kFirstColumnX, kFirstRowY, kComposeButtonWidth, kComposeButtonHeight)];
    [self addComposeButtonwithTitle:@"相册" image:@"tabbar_compose_photo" Frame:CGRectMake(kSecondColumnX, kFirstRowY, kComposeButtonWidth, kComposeButtonHeight)];
    [self addComposeButtonwithTitle:@"拍摄" image:@"tabbar_compose_camera" Frame:CGRectMake(kThirdColumnX, kFirstRowY, kComposeButtonWidth, kComposeButtonHeight)];
    [self addComposeButtonwithTitle:@"签到" image:@"tabbar_compose_lbs" Frame:CGRectMake(kFirstColumnX, kSecondRowY, kComposeButtonWidth, kComposeButtonHeight)];
    [self addComposeButtonwithTitle:@"点评" image:@"tabbar_compose_review" Frame:CGRectMake(kSecondColumnX, kSecondRowY, kComposeButtonWidth, kComposeButtonHeight)];
    [self addComposeButtonwithTitle:@"更多" image:@"tabbar_compose_more" Frame:CGRectMake(kThirdColumnX, kSecondRowY, kComposeButtonWidth, kComposeButtonHeight)];
    
    UIImageView *backGround = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"compose_background"]];
    backGround.frame = CGRectMake(0, 20, 320, 500);
    [self.view addSubview:backGround];
    [self.view sendSubviewToBack:backGround];
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)addComposeButtonwithTitle:(NSString *)title image:(NSString *)imageName Frame:(CGRect)frame {
    static int tag = 1;
    ComposeButton *Btn = [ComposeButton buttonWithType:UIButtonTypeCustom];
    Btn.tag = tag++;
    Btn.frame = frame;
    [Btn setTitle:title forState:UIControlStateNormal];
    Btn.titleLabel.font = [UIFont systemFontOfSize:12.0];
    [Btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    Btn.titleLabel.textAlignment = NSTextAlignmentCenter;
    [Btn setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    [Btn addTarget:self action:@selector(ButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [[self.view viewWithTag:0] addSubview:Btn];
}

#pragma -监听按钮点击
- (void)ButtonClick:(ComposeButton *)Button {
    switch (Button.tag) {
        case 1:
            [self performSegueWithIdentifier:@"Idea" sender:nil];
            break;
            
        default:
            break;
    }
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
