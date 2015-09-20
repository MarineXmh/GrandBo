//
//  Token.m
//  GrandBo
//
//  Created by Xu Menghua on 15/9/20.
//  Copyright © 2015年 Xu Menghua. All rights reserved.
//

#import "Token.h"

@implementation Token

+ (NSString *)loadToken {
    NSString *path = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0]stringByAppendingPathComponent:@"token.txt"];
    NSError *error = nil;
    NSString *token = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:&error];
    return token;
}

@end
