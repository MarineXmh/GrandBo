//
//  ImageViewWithCache.h
//  GrandBo
//
//  Created by Xu Menghua on 15/9/18.
//  Copyright (c) 2015年 Xu Menghua. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ImageViewWithCache : UIImageView 

@property (nonatomic, strong) NSString *filename;
@property (nonatomic, strong) NSString *defaultImage;
@property (nonatomic, strong) NSString *imageURL;

@end
