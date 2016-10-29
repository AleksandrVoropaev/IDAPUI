//
//  AVImagesCache.m
//  iOSProject
//
//  Created by Aleksandr Voropaev on 10/29/16.
//  Copyright © 2016 Aleksandr Voropaev. All rights reserved.
//

#import "AVImageModelsCache.h"

#import "AVWeakifyStrongify.h"

@interface AVImageModelsCache ()
@property (nonatomic, strong)   NSMapTable  *cache;

@end

@implementation AVImageModelsCache

#pragma mark -
#pragma mark Class Methods

+ (instancetype)cache {
//    AVWeakify(self);
//    static dispatch_once_t onceToken;
//    dispatch_once(&onceToken, ^{
//        AVStrongify(self);
//        return [[self alloc] init];
//    });
    return [[self alloc] init];
}

#pragma mark -
#pragma mark Initializations and Deallocations

- (instancetype)init {
    self = [super init];
    self.cache = [NSMapTable weakToWeakObjectsMapTable];
    
    return self;
}

#pragma mark -
#pragma mark Public

- (void)addImageModel:(AVImageModel *)model withURL:(NSURL *)url {
    if (![self containsImageModelWithURL:url]) {
        [self.cache setObject:model forKey:url];
    }
}

- (void)addImageModelWithURL:(NSURL *)url {
    AVImageModel *model = [AVImageModel imageWithURL:url];
    [self addImageModel:model withURL:url];
}

- (void)addImageModel:(AVImageModel *)model {
    NSURL *url = model.url;
    [self addImageModel:model withURL:url];
}

- (void)removeImageModelWithURL:(NSURL *)url {
    [self.cache removeObjectForKey:url];
}

- (void)removeImageModel:(AVImageModel *)model {
    [self.cache removeObjectForKey:model.url];
}

- (BOOL)containsImageModelWithURL:(NSURL *)url {
    for (id key in self.cache.keyEnumerator) {
        if (key == url) {
            return YES;
        }
    }
    
    return NO;
}

- (BOOL)containsImageModel:(AVImageModel *)imageModel {
    for (AVImageModel *model in self.cache.objectEnumerator) {
        if (model == imageModel) {
            return YES;
        }
    }
    
    return NO;
}

- (AVImageModel *)imageModelWithURL:(NSURL *)url {
    if ([self containsImageModelWithURL:url]) {
        return [self.cache objectForKey:url];
    }
    
    return nil;
}

- (NSURL *)URLForImageModel:(AVImageModel *)model {
    if ([self containsImageModel:model]) {
        return model.url;
    }
    
    return nil;
}

#pragma mark -
#pragma mark Private

@end
