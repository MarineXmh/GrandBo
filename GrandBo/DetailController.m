//
//  DetailController.m
//  GrandBo
//
//  Created by Xu Menghua on 15/10/2.
//  Copyright © 2015年 Xu Menghua. All rights reserved.
//

#import "DetailController.h"
#import "Status.h"
#import "CellToolBar.h"
#import "CellToolBarButton.h"
#import "DetailCell.h"
#import "User.h"
#import "DetailStatusFrame.h"
#import "CommentCell.h"
#import "CommentFrame.h"
#import "LGRefreshView.h"
#import "LoadMoreFooter.h"
#import "Comment.h"

@interface DetailController ()

@property (nonatomic, strong) DetailStatusFrame *detailFrame;
@property (nonatomic, strong) NSMutableArray *commentsArray;
@property (nonatomic, assign) int commentPgae;
@property (nonatomic, strong) LGRefreshView *refreshView;
@property (nonatomic, strong) LoadMoreFooter *footer;

@end

@implementation DetailController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.commentsArray = [[NSMutableArray alloc]init];
    self.detailFrame = [[DetailStatusFrame alloc]init];
    
    self.commentPgae = 1;
    self.detailFrame.status = self.status;
    
    [self getComments:self.commentPgae++];
    
    self.footerBar = [[CellToolBar alloc]init];
    self.footerBar.frame = CGRectMake(10, 546, 300, 22);
    self.footerBar.opaque = YES;
    [self.view addSubview:self.footerBar];
    [self.footerBar.comment addTarget:self action:@selector(commentBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.footerBar.expand addTarget:self action:@selector(expandBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.footerBar.good addTarget:self action:@selector(likeBtnClick) forControlEvents:UIControlEventTouchUpInside];
    
    [self refresh];
    UITableViewHeaderFooterView *footerView = [self.tableView footerViewForSection:2];
    self.footer = [[LoadMoreFooter alloc]init];
    [footerView addSubview:self.footer];
    self.tableView.tableFooterView = self.footer;
    
    [self.tableView reloadData];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidAppear:(BOOL)animated {
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark - tableView dataSource and delegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    switch (section) {
        case 0:
            return 1;
            
        case 1:
            return self.status.comentsCount;
            
        default:
            return 0;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        DetailCell *cell = [tableView cellForRowAtIndexPath:indexPath];
        
        if (cell == nil) {
            cell = [[DetailCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"DetailCell"];
        }
        
        cell.detailFrame = self.detailFrame;
        
        return cell;
    }else {
        CommentCell *cell = [tableView cellForRowAtIndexPath:indexPath];
        
        if (cell == nil) {
            cell = [[CommentCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"CommentCell"];
        }
        
        cell.commentFrame = self.commentsArray[indexPath.row];
        
        return cell;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        //NSLog(@"%f", self.detailFrame.cellHeight);
        return self.detailFrame.cellHeight;
    }else {
        CommentFrame *commentFrame = self.commentsArray[indexPath.row];
        //NSLog(@"%f", commentFrame.cellHeight);
        return commentFrame.cellHeight;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        return 10;
    }
    return 10;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark - 事件处理

- (IBAction)cancel:(UIBarButtonItem *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)commentBtnClick {
    [self performSegueWithIdentifier:@"detailToComment" sender:self.status];
}

- (void)expandBtnClick {
    [self performSegueWithIdentifier:@"detailToExpand" sender:self.status];
}

- (void)likeBtnClick {
    
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"detailToComment"]) {
        UIViewController *destination = [segue destinationViewController];
        [destination setValue:sender forKey:@"status"];
        //NSLog(@"%@", [sender valueForKeyPath:@"id"]);
    }
    
    if ([segue.identifier isEqualToString:@"detailToExpand"]) {
        UIViewController *destination = [segue destinationViewController];
        [destination setValue:sender forKey:@"status"];
    }
}

#pragma mark - 从服务器获得评论列表

- (void)getComments:(int)page {
    @try {
        NSString *urlString = [NSString stringWithFormat:@"http://vv.fuckjob.top/api/v1/microposts/%d/comments?%d", self.status.id, page];
        NSURL *url = [NSURL URLWithString:urlString];
        NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:3.0];
        [request setHTTPMethod:@"get"];
        NSURLResponse *respons = nil;
        NSError *error = nil;
        //NSLog(@"%@", urlString);
        
        NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:&respons error:&error];
        
        NSError *jsonError = nil;
        NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:&jsonError];
        NSArray *array = [dictionary objectForKey:@"comments"];
        //NSLog(@"%@", array);
        
        for (int i = 0; i < array.count; i++) {
            User *user = [[User alloc]init];
            Comment *comment = [[Comment alloc]init];
            CommentFrame *commentFrame = [[CommentFrame alloc]init];
            user.name = [[array[i] objectForKey:@"user"]objectForKey:@"name"];
            user.id = [[array[i] objectForKey:@"user"]objectForKey:@"id"];
            user.avatarURL = [[array[i] objectForKey:@"user"]objectForKey:@"avatar_url"];
            comment.content = [array[i] objectForKey:@"content"];
            comment.time = [array[i] objectForKey:@"created_at"];
            comment.id = [[array[i] objectForKey:@"id"]intValue];
            comment.likesCount = [[array[i] objectForKey:@"likes_count"]intValue];
            comment.isLiked = [[array[i] objectForKey:@"liked"]boolValue];
            comment.user = user;
            commentFrame.comment = comment;
            [self.commentsArray addObject:commentFrame];
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
                        self.commentPgae = 1;
                        [self.commentsArray removeAllObjects];
                        
                        if (wself)
                        {
                            __strong typeof(wself) self = wself;
                            
                            [self getComments:self.commentPgae++];
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
    if (self.commentsArray.count == 0  || self.footer.isRefreshing) {
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
    [self getComments:self.commentPgae++];
    [self.footer endRefresh];
    [self.tableView reloadData];
}

@end
