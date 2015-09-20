//
//  ImageViewWithCache.m
//  GrandBo
//
//  Created by Xu Menghua on 15/9/18.
//  Copyright (c) 2015年 Xu Menghua. All rights reserved.
//

#import "ImageViewWithCache.h"

@implementation ImageViewWithCache

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void)setDefaultImage:(NSString *)defaultImage {
    if (_defaultImage != defaultImage) {
        _defaultImage = defaultImage;
    }
    [self setImage:[UIImage imageNamed:_defaultImage]];
}

- (void)setImageURL:(NSString *)imageURL {
    if (_imageURL != imageURL) {
        _imageURL = imageURL;
    }
    if (_imageURL != nil) {
        NSOperationQueue *queue = [[NSOperationQueue alloc]init];
        queue.maxConcurrentOperationCount = 2;
        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask, YES);
        NSString *documentsDirectory = [paths objectAtIndex:0];
        NSMutableString * path = [[NSMutableString alloc]initWithString:documentsDirectory];
        [path appendString:[NSString stringWithFormat:@"/%@", self.imageURL]];
        
        __block NSData *image = [NSData dataWithContentsOfFile:[NSString stringWithFormat:@"/%@.img", path]];
        if (image == nil) {
            [queue addOperationWithBlock:^{
                image = [self loadImage];
            }];
        }
        //NSLog(@"%@", image);
        [self setImage:[UIImage imageWithData:image]];
    }
}

#pragma mark - 从网络请求图片，缓存到本地

- (NSData *)loadImage {
    NSData *image = [NSData dataWithContentsOfURL:[NSURL URLWithString:self.imageURL]];
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSMutableString * path = [[NSMutableString alloc]initWithString:documentsDirectory];
    [path appendString:[NSString stringWithFormat:@"/%@", self.imageURL]];
    
    NSFileManager *fm = [NSFileManager defaultManager];
    
    if (![fm fileExistsAtPath:path]) {
        NSError *e = nil;
        [fm createDirectoryAtPath:path withIntermediateDirectories:YES attributes:nil error:&e];
        //NSLog(@"%@", e.localizedDescription);
    }
    
    if (![fm createFileAtPath:[NSString stringWithFormat:@"/%@.img", path] contents:image attributes:nil]) {
        return nil;
    }
    
    return image;
}

@end
