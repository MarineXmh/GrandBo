//
//  DetailController.h
//  GrandBo
//
//  Created by Xu Menghua on 15/10/2.
//  Copyright © 2015年 Xu Menghua. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Status;
@class CellToolBar;

@interface DetailController : UIViewController <UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong) Status *status;
@property (nonatomic, strong) CellToolBar *footerBar;

@property (weak, nonatomic) IBOutlet UITableView *tableView;

- (IBAction)cancel:(UIBarButtonItem *)sender;


@end
