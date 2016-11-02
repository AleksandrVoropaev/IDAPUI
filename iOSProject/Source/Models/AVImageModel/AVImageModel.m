//
//  AVImageModel.m
//  iOSProject
//
//  Created by Aleksandr Voropaev on 9/7/16.
//  Copyright © 2016 Aleksandr Voropaev. All rights reserved.
//

#import "AVImageModel.h"

#import "AVImageModelsCache.h"

#import "NSFileManager+AVExtensions.h"
#import "AVSwitchCaseMacro.h"
#import "AVGCD.h"
#import "AVWeakifyStrongify.h"
#import "NSString+AVExtensions.h"

@interface AVImageModel ()
@property (nonatomic, strong)   UIImage     *image;
@property (nonatomic, strong)   NSString    *imageName;
@property (nonatomic, strong)   NSString    *imagePath;
@property (nonatomic, strong)   NSURL       *url;

@end

@implementation AVImageModel

#pragma mark -
#pragma mark Class Methods

+ (instancetype)imageWithURL:(NSURL *)url {
    return [[self alloc] initWithURL:url];
}

#pragma mark -
#pragma mark Initializations and Deallocations

- (void)dealloc {
    AVImageModelsCache *imageModelCache = [AVImageModelsCache cache];
    [imageModelCache removeImageModel:self];
}

- (instancetype)initWithURL:(NSURL *)url {
    self = [super init];
    AVImageModelsCache *imageModelCache = [AVImageModelsCache cache];
    if ([imageModelCache containsImageModel:self]) {
        self = [imageModelCache imageModelWithURL:url];
        return self;
    }
    
    self.url = url;
    [imageModelCache addImageModel:self];
    
    return self;
}

#pragma mark -
#pragma mark Accessors

- (NSString *)imageName {
    return [NSString stringWithFormat:@"%@.%@", [self imageNameWithoutExtension], [self imageExtension]];
}

- (NSString *)imageNameWithoutExtension {
    return [NSString fileNameWithoutExtensionWithURL:self.url];
}

- (NSString *)imageExtension {
    return self.url.path.pathExtension;
}

#pragma mark -
#pragma mark Public

- (void)performLoading {
    //need to remove -------------------------------------
    sleep(2);
    //----------------------------------------------------
    @synchronized (self) {
        NSString *path = [NSFileManager applicationDataFilePath:self.imageName];
        UIImage *image = [UIImage imageWithContentsOfFile:path];
        if (!image) {
            NSData *imageData = [NSData dataWithContentsOfURL:self.url];
            image = [UIImage imageWithData:imageData];
            if (image) {
                [self cacheImageData:imageData];
            }
        }
        
        self.image = image;
        self.state = image ? AVModelStateDidLoad : AVModelStateDidFailLoading;
    }
}

#pragma mark -
#pragma mark Private

- (void)cacheImageData:(NSData *)imageData {
    BOOL result = [imageData writeToFile:[NSFileManager applicationDataFilePath:self.imageName] atomically:YES];
    NSLog(@"%i", result);
}

- (void)deleteCachedImage {
    [[NSFileManager defaultManager] removeItemAtPath:[NSFileManager applicationDataFilePath:self.imageName] error:nil];
}

@end
