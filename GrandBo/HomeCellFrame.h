//
//  HomeCellFrame.h
//  GrandBo
//
//  Created by Xu Menghua on 15/9/15.
//  Copyright (c) 2015年 Xu Menghua. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class Status;

@interface HomeCellFrame : NSObject

@property (nonatomic, assign) CGRect avatarFrame;
@property (nonatomic, assign) CGRect nameFrame;
@property (nonatomic, assign) CGRect timeFrame;
@property (nonatomic, assign) CGRect fromFrame;
@property (nonatomic, assign) CGRect contentFrame;
@property (nonatomic, assign) CGFloat cellHeight;
@property (nonatomic, strong) Status *status;

@end
