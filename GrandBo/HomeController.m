//
//  HomeController.m
//  GrandBo
//
//  Created by Xu Menghua on 15/9/2.
//  Copyright (c) 2015年 Xu Menghua. All rights reserved.
//

#import "HomeController.h"
#import "User.h"
#import "Status.h"
#import "HomeTableViewCell.h"
#import "HomeCellFrame.h"
#import "LoginController.h"
#import "LGRefreshView.h"
#import "LoadMoreFooter.h"
#import "Token.h"

@interface HomeController ()

@property (nonatomic, strong) NSMutableArray *statusFrames;
@property (nonatomic, assign) int pageIndex;
@property (nonatomic, strong) LGRefreshView *refreshView;
@property (nonatomic, strong) LoadMoreFooter *footer;

@end

@implementation HomeController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.statusFrames = [[NSMutableArray alloc]init];
    
    [self refresh];
    UITableViewHeaderFooterView *footerView = [self.tableView footerViewForSection:1];
    self.footer = [[LoadMoreFooter alloc]init];
    [footerView addSubview:_footer];
    self.tableView.tableFooterView = _footer;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

- (void)viewDidAppear:(BOOL)animated {
    self.pageIndex = 1;
    self.token = [Token loadToken];
    
    if (self.token == nil) {
        [self performSegueWithIdentifier:@"login" sender:nil];
    }
    
    [self getFeed:self.pageIndex++];
    [self.tableView reloadData];
    //NSLog(@"%@", self.currentUsername);
}

#pragma mark - TableView数据源和代理方法

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    //NSLog(@"%ld", self.statusFrames.count);
    return self.statusFrames.count;
}

- (HomeTableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    //HomeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"HomeTableViewCell"];
    HomeTableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    
    if (cell == nil) {
        cell = [[HomeTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"HomeTableViewCell"];
    }
    
    cell.cellFrame = self.statusFrames[indexPath.row];
    cell.delegate = self;
    cell.indexPath = indexPath;
    //NSLog(@"%@",cell.cellFrame.status.user.name);
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    HomeCellFrame *cellFrame = self.statusFrames[indexPath.row];
    return cellFrame.cellHeight;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark - 从服务器获得数据

- (void)getFeed:(int)page {
    @try {
        NSString *urlString = [NSString stringWithFormat:@"http://vv.fuckjob.top/api/v1/home_feed.json?access_token=%@&page=%d", self.token, page];
        NSURL *url = [NSURL URLWithString:urlString];
        NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:3.0];
        [request setHTTPMethod:@"get"];
        NSURLResponse *respons = nil;
        NSError *error = nil;
        
        NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:&respons error:&error];
        
        NSError *jsonError = nil;
        NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:&jsonError];
        NSArray *array = [dictionary objectForKey:@"microposts"];
        //NSLog(@"%@", array);
        
        for (int i = 0; i < array.count; i++) {
            User *user = [[User alloc]init];
            Status *status = [[Status alloc]init];
            HomeCellFrame *cellFrame = [[HomeCellFrame alloc]init];
            user.name = [[array[i] objectForKey:@"user"]objectForKey:@"name"];
            user.id = [[array[i] objectForKey:@"user"]objectForKey:@"id"];
            user.avatarURL = [[array[i] objectForKey:@"user"]objectForKey:@"avatar_url"];
            status.content = [array[i] objectForKey:@"content"];
            status.time = [array[i] objectForKey:@"created_at"];
            status.id = [[array[i] objectForKey:@"id"]intValue];
            status.comentsCount = [[array[i] objectForKey:@"comments_count"]intValue];
            status.likesCount = [[array[i] objectForKey:@"likes_count"]intValue];
            status.user = user;
            cellFrame.status = status;
            [self.statusFrames addObject:cellFrame];
            //NSLog(@"%d", cellFrame.status.comentsCount);
        }
    }
    @catch (NSException *exception) {
        UIAlertView* dialogue = [[UIAlertView alloc]initWithTitle:nil message:@"网络错误" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [dialogue show];
    }
    @finally {
        
    }
    
}

#pragma mark - 下拉刷新

- (void)refresh {
    UIColor *blueColor = [UIColor colorWithRed:0.f green:0.5 blue:1.f alpha:1.f];
    UIColor *grayColor = [UIColor colorWithRed:0.9 green:0.9 blue:0.9 alpha:1.f];
    
    __weak typeof(self) wself = self;
    
    _refreshView = [LGRefreshView refreshViewWithScrollView:_tableView
                                             refreshHandler:^(LGRefreshView *refreshView)
                    {
                        self.pageIndex = 1;
                        [self.statusFrames removeAllObjects];
                        
                        if (wself)
                        {
                            __strong typeof(wself) self = wself;

                            [self getFeed:self.pageIndex++];
                            [self.tableView reloadData];
                            
                            //NSLog(@"%@", [self.statusFrames[0] valueForKeyPath:@"status.content"]);
                            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^(void)
                                           {
                                               [self.refreshView endRefreshing];
                                           });
                        }
                    }];
    _refreshView.tintColor = blueColor;
    _refreshView.backgroundColor = grayColor;
}

#pragma mark - 上拉加载更多数据

-(void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if (self.statusFrames.count == 0  || self.footer.isRefreshing) {
        return;
    }
    
    // 1.差距
    CGFloat delta = scrollView.contentSize.height - scrollView.contentOffset.y;
    // 刚好能看到整个footer的高度
    CGFloat seeFootH = self.tableView.frame.size.height - 49;
    
    // 2.如果能看到整个footer
    if (delta <= (seeFootH - 0)) {
        // 进入上拉刷新状态
        [self.footer beginRefresh];
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC) ),dispatch_get_main_queue(), ^{
            
            [self loadMore];
        });
    }
}

- (void)loadMore {
    [self getFeed:self.pageIndex++];
    [self.footer endRefresh];
    [self.tableView reloadData];
}

#pragma mark - 处理Toolbar按钮点击事件

- (void)didExpandBtnClicked:(CellToolBarButton *)button indexPath:(NSIndexPath *)indexPath {
    
}

- (void)didCommentBtnClicked:(CellToolBarButton *)button indexPath:(NSIndexPath *)indexPath {
    HomeCellFrame *cellFrame = [self.statusFrames objectAtIndex:indexPath.row];
    Status *status = cellFrame.status;
    //NSLog(@"%@", button);
    //NSLog(@"%ld",indexPath.row);
    [self performSegueWithIdentifier:@"comment" sender:status];
}

- (void)didGoodBtnClicked:(CellToolBarButton *)button indexPath:(NSIndexPath *)indexPath {
    
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"comment"]) {
        UIViewController *destination = [segue destinationViewController];
        [destination setValue:sender forKey:@"status"];
        //NSLog(@"%@", [sender valueForKeyPath:@"id"]);
    }
}

@end
