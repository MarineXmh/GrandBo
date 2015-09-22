//
//  HomeTableViewCell.h
//  GrandBo
//
//  Created by Xu Menghua on 15/9/12.
//  Copyright (c) 2015年 Xu Menghua. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Status;
@class HomeCellFrame;
@class CellToolBarButton;

@protocol HomeTableViewCellDelegate <NSObject>

- (void)didExpandBtnClicked:(CellToolBarButton *)button indexPath:(NSIndexPath *)indexPath;
- (void)didCommentBtnClicked:(CellToolBarButton *)button indexPath:(NSIndexPath *)indexPath;
- (void)didGoodBtnClicked:(CellToolBarButton *)button indexPath:(NSIndexPath *)indexPath;

@end

@interface HomeTableViewCell : UITableViewCell

@property (nonatomic, strong) HomeCellFrame *cellFrame;
@property (nonatomic, strong) id<HomeTableViewCellDelegate> delegate;
@property (nonatomic, strong) NSIndexPath *indexPath;

@end
