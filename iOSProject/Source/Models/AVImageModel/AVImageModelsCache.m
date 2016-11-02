//
//  AVImagesCache.m
//  iOSProject
//
//  Created by Aleksandr Voropaev on 10/29/16.
//  Copyright © 2016 Aleksandr Voropaev. All rights reserved.
//

#import "AVImageModelsCache.h"

#import "AVWeakifyStrongify.h"
#import "AVDispatchMacro.h"

@interface AVImageModelsCache ()
@property (nonatomic, strong)   NSMapTable  *cache;

@end

@implementation AVImageModelsCache

#pragma mark -
#pragma mark Class Methods

+ (instancetype)cache {
    AVDispatchOnceMacro(imageModelCache, AVImageModelsCache, ^{
        return [self new];
    });
}

#pragma mark -
#pragma mark Initializations and Deallocations

- (instancetype)init {
    self = [super init];
    self.cache = [NSMapTable strongToWeakObjectsMapTable];
    
    return self;
}

#pragma mark -
#pragma mark Public

- (void)addImageModel:(AVImageModel *)model {
    @synchronized (self) {
        [self addImageModel:model withURL:model.url];
    }
}

- (void)removeImageModel:(AVImageModel *)model {
    [self removeImageModelWithURL:model.url];
}

- (BOOL)containsImageModel:(AVImageModel *)imageModel {
    return [self containsImageModelWithURL:imageModel.url];
}

- (AVImageModel *)imageModelWithURL:(NSURL *)url {
    @synchronized (self) {
        return [self.cache objectForKey:url];
    }
}

#pragma mark -
#pragma mark Private

- (void)addImageModel:(AVImageModel *)model withURL:(NSURL *)url {
    @synchronized (self) {
        if (![self containsImageModelWithURL:url]) {
            [self.cache setObject:model forKey:url];
        }
    }
}

- (void)removeImageModelWithURL:(NSURL *)url {
    @synchronized (self) {
        [self.cache removeObjectForKey:url];
    }
}

- (BOOL)containsImageModelWithURL:(NSURL *)url {
    @synchronized (self) {
        return !![self.cache objectForKey:url];
    }
}

@end
