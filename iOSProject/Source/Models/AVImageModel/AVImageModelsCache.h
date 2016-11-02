//
//  AVImagesCache.h
//  iOSProject
//
//  Created by Aleksandr Voropaev on 10/29/16.
//  Copyright © 2016 Aleksandr Voropaev. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "AVImageModel.h"

@interface AVImageModelsCache : NSObject

+ (instancetype)cache;

- (void)addImageModel:(AVImageModel *)model;
- (void)removeImageModel:(AVImageModel *)model;
- (BOOL)containsImageModel:(AVImageModel *)model;
- (AVImageModel *)imageModelWithURL:(NSURL *)url;

@end
