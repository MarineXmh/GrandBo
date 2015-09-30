//
//  ProfileController.m
//  GrandBo
//
//  Created by Xu Menghua on 15/9/3.
//  Copyright (c) 2015年 Xu Menghua. All rights reserved.
//

#import "ProfileController.h"
#import "ProfileCell.h"
#import "UserCell.h"
#import "CurrentUser.h"
#import "User.h"

@interface ProfileController ()

@property (nonatomic, strong) User *currentUser;

@end

@implementation ProfileController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.currentUser = [[User alloc]init];
    
    [self getUserInformation];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source and delegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 5;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    switch (section) {
        case 0:
            return 1;
        case 1:
            return 1;
        case 2:
            return 3;
        case 3:
            return 1;
        case 4:
            return 1;
        default:
            return 0;
    }
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        return 120;
    }
    return 44;
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section != 0) {
        ProfileCell *cell = [[ProfileCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"ProfileCell"];
        if (indexPath.section == 1) {
            [cell setTextAndImage:@"新的好友" image:@"new_friend"];
            return cell;
        }
        if (indexPath.section == 2) {
            switch (indexPath.row) {
                case 0:
                    [cell setTextAndImage:@"我的相册" image:@"album"];
                    return cell;
                case 1:
                    [cell setTextAndImage:@"我的点评" image:@"collect"];
                    return cell;
                case 2:
                    [cell setTextAndImage:@"我的赞" image:@"like"];
                    return cell;
                default:
                    return cell;
            }
        }
        if (indexPath.section == 3) {
            [cell setTextAndImage:@"草稿箱" image:@"draft"];
            return cell;
        }
        if (indexPath.section == 4) {
            [cell setTextAndImage:@"更多" image:@"more"];
            return cell;
        }
    }
    
    UserCell *cell = [[UserCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"UserCell"];
    
    [cell settingData:self.currentUser];
    
    return cell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark - 获得当前登录用户的信息

- (void)getUserInformation {
    @try {
        NSString *currentUsername = [CurrentUser loadCurrentUser];
        NSString *urlString = [NSString stringWithFormat:@"http://vv.fuckjob.top/api/v1/users/%@", [currentUsername stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
        NSURL *url = [NSURL URLWithString:urlString];
        NSURLRequest *request = [NSURLRequest requestWithURL:url cachePolicy:NSURLRequestReloadIgnoringLocalCacheData timeoutInterval:3.0];
        
        NSURLResponse *response = nil;
        NSError *error = nil;
        NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
        
        NSError *jsonError = nil;
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:&jsonError];
        NSDictionary *userData = [dict objectForKey:@"user"];
        
        self.currentUser.name = [userData objectForKey:@"name"];
        self.currentUser.id = [userData objectForKey:@"id"];
        self.currentUser.avatarURL = [userData objectForKey:@"avatar_url"];
        self.currentUser.micropostsCount = [[userData objectForKey:@"microposts_count"]intValue];
        self.currentUser.followingCount = [[userData objectForKey:@"following_count"]intValue];
        self.currentUser.followersCount = [[userData objectForKey:@"followers_count"]intValue];
        
        //NSLog(@"%@", self.currentUser.name);
    }
    @catch (NSException *exception) {
        UIAlertView* dialogue = [[UIAlertView alloc]initWithTitle:nil message:@"网络错误" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [dialogue show];
    }
    @finally {
        
    }
}

@end
