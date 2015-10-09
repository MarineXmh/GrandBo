//
//  Comment.h
//  GrandBo
//
//  Created by Xu Menghua on 15/10/4.
//  Copyright © 2015年 Xu Menghua. All rights reserved.
//

#import <Foundation/Foundation.h>

@class User;

@interface Comment : NSObject

@property (nonatomic, strong) User *user;
@property (nonatomic, strong) NSString *content;
@property (nonatomic, strong) NSString *time;
@property (nonatomic, assign) int id;
@property (nonatomic, assign) BOOL isLiked;
@property (nonatomic, assign) int likesCount;
@property (nonatomic, assign) int micropostId;

@end
