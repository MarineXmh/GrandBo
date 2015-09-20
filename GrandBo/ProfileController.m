//
//  ProfileController.m
//  GrandBo
//
//  Created by Xu Menghua on 15/9/3.
//  Copyright (c) 2015年 Xu Menghua. All rights reserved.
//

#import "ProfileController.h"

@interface ProfileController ()

@property (nonatomic,strong) NSArray *proFileCells;

@end

@implementation ProfileController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma - Table view data source ande delegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 6;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    switch (section) {
        case 0:
            return 2;
        case 1:
            return 1;
        case 2:
        case 3:
            return 3;
        case 4:
        case 5:
            return 1;
        default:
            return 0;
    }
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        switch (indexPath.row) {
            case 0:
                return 80;
                
            default:
                return 44;
        }
    }
    return 44;
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell ;//= [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell" forIndexPath:indexPath];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"UITableViewCell"];
    } else {
        
        
    }
    if (indexPath.section == 0) {
        return cell;
    }
    if (indexPath.section == 1) {
        [cell.textLabel setText:@"新的好友"];
        [cell.imageView setImage:[UIImage imageNamed:@"toolbar_icon_groupspace"]];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        return cell;
    }
    if (indexPath.section == 2) {
        switch (indexPath.row) {
            case 0:
                [cell.textLabel setText:@"我的相册"];
                cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
                [cell.imageView setImage:[UIImage imageNamed:@"toolbar_icon_album"]];
                return cell;
            case 1:
                [cell.textLabel setText:@"我的点评"];
                cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
                [cell.imageView setImage:[UIImage imageNamed:@"toolbar_icon_writing"]];
                return cell;
            case 2:
                [cell.textLabel setText:@"我的赞"];
                [cell.imageView setImage:[UIImage imageNamed:@"toolbar_icon_unlike"]];
                cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
                return cell;
            default:
                return cell;
        }
    }
    if (indexPath.section == 3) {
        switch (indexPath.row) {
            case 0:
                [cell.textLabel setText:@"微博会员"];
                cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
                return cell;
            case 1:
                [cell.textLabel setText:@"微博运动"];
                cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
                return cell;
            case 2:
                [cell.textLabel setText:@"微博支付"];
                cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
                return cell;
            default:
                return cell;
        }
    }
    if (indexPath.section == 4) {
        [cell.textLabel setText:@"草稿箱"];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        [cell.imageView setImage:[UIImage imageNamed:@"toolbar_compose"]];
        return cell;
    }
    if (indexPath.section == 5) {
        [cell.textLabel setText:@"更多"];
        [cell.imageView setImage:[UIImage imageNamed:@"toolbar_more"]];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        return cell;
    }

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

@end
