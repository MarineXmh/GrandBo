//
//  HomeController.h
//  GrandBo
//
//  Created by Xu Menghua on 15/9/2.
//  Copyright (c) 2015年 Xu Menghua. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HomeTableViewCell;

@interface HomeController : UIViewController <UITableViewDataSource,UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *usernameTitle;
@property (nonatomic, strong) NSString *token;


@end
