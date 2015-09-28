//
//  User.h
//  GrandBo
//
//  Created by Xu Menghua on 15/9/12.
//  Copyright (c) 2015年 Xu Menghua. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *avatarURL;
@property (nonatomic, strong) NSNumber *id;
@property (nonatomic, assign) int micropostsCount;
@property (nonatomic, assign) int followingCount;
@property (nonatomic, assign) int followersCount;

@end
