//
//  Status.h
//  GrandBo
//
//  Created by Xu Menghua on 15/9/12.
//  Copyright (c) 2015年 Xu Menghua. All rights reserved.
//

#import <Foundation/Foundation.h>

@class User;

@interface Status : NSObject

@property (nonatomic, strong) User *user;
@property (nonatomic, strong) NSString *content;
@property (nonatomic, assign) int id;
@property (nonatomic, strong) NSString *time;
@property (nonatomic, assign) int likesCount;
@property (nonatomic, assign) int comentsCount;
@property (nonatomic, assign) BOOL isLiked;

@end
