//
//  CurrentUser.h
//  GrandBo
//
//  Created by Xu Menghua on 15/9/23.
//  Copyright © 2015年 Xu Menghua. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CurrentUser : NSObject

+ (NSString *)loadCurrentUser;
+ (BOOL)saveCurrentUser:(NSString *)username;
+ (BOOL)deleteCurrentUser;

@end
