//
//  CurrentUser.m
//  GrandBo
//
//  Created by Xu Menghua on 15/9/23.
//  Copyright © 2015年 Xu Menghua. All rights reserved.
//

#import "CurrentUser.h"

@implementation CurrentUser

+ (NSString *)loadCurrentUser {
    NSString *path = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0]stringByAppendingPathComponent:@"currentUser.txt"];
    NSError *error = nil;
    NSString *token = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:&error];
    return token;
}

+ (BOOL)saveCurrentUser:(NSString *)token {
    NSString *path = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0]stringByAppendingPathComponent:@"currentUser.txt"];
    NSError *error = nil;
    [token writeToFile:path atomically:YES encoding:NSUTF8StringEncoding error:&error];
    return YES;
}

+ (BOOL)deleteCurrentUser {
    NSString *path = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0]stringByAppendingPathComponent:@"currentUser.txt"];
    NSError *error = nil;
    [[NSFileManager defaultManager] removeItemAtPath:path error:&error];
    return YES;
}

@end
