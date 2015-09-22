//
//  CellToolBar.h
//  GrandBo
//
//  Created by Xu Menghua on 15/9/21.
//  Copyright © 2015年 Xu Menghua. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CellToolBarButton;

@interface CellToolBar : UIView

@property (nonatomic, strong) CellToolBarButton *expand;
@property (nonatomic, strong) CellToolBarButton *comment;
@property (nonatomic, strong) CellToolBarButton *good;

@end
