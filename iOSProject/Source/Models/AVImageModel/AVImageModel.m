//
//  AVImageModel.m
//  iOSProject
//
//  Created by Aleksandr Voropaev on 9/7/16.
//  Copyright © 2016 Aleksandr Voropaev. All rights reserved.
//

#import "AVImageModel.h"

#import "NSFileManager+AVExtensions.h"
#import "AVSwitchCaseMacro.h"
#import "AVGCD.h"
#import "AVWeakifyStrongify.h"
#import "AVImageModelsCache.h"

@interface AVImageModel ()
@property (nonatomic, strong)   UIImage     *image;
@property (nonatomic, strong)   NSData      *imageData;
@property (nonatomic, strong)   NSString    *imageName;
@property (nonatomic, strong)   NSString    *imageExtension;
@property (nonatomic, strong)   NSString    *imageNameWithoutExtension;
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
    if ([imageModelCache containsImageModelWithURL:url]) {
        self = [imageModelCache imageModelWithURL:url];
        return self;
    }
    
    self.url = url;
    [imageModelCache addImageModel:self withURL:url];
    
    return self;
}

#pragma mark -
#pragma mark Accessors

- (NSString *)imageName {
    return [NSString stringWithFormat:@"%@.%@", [self imageNameWithoutExtension], [self imageExtension]];
}

- (NSString *)imageNameWithoutExtension {
    NSString *path = self.url.absoluteString;
    NSString *pathWithoutExtension = path.stringByDeletingPathExtension;
    NSString *pathWithoutSymbols = [self deleteSymbols:@[@"/", @":", @".", @"-"] inString:pathWithoutExtension];
    NSCharacterSet *characters = [NSCharacterSet URLPathAllowedCharacterSet];
    NSString *pathWithEncoding = [pathWithoutSymbols stringByAddingPercentEncodingWithAllowedCharacters:characters];
    
//    NSLog(@"%@", pathWithEncoding);

    return pathWithEncoding;
}

- (NSString *)imageExtension {
    return self.url.path.pathExtension;
}

#pragma mark -
#pragma mark Public

- (void)performLoading {
    @synchronized (self) {
        NSString *path = [NSFileManager applicationDataFilePath:self.imageName];
        UIImage *image = [UIImage imageWithContentsOfFile:path];
        if (!image) {
            NSData *imageData = [NSData dataWithContentsOfURL:self.url];
            image = [UIImage imageWithData:imageData];
            if (image) {
                self.imageData = imageData;
                [self cacheImage:image];
            }
        }
        
        if (image) {
            self.image = image;
            self.state = AVModelStateDidLoad;
        } else {
            self.state = AVModelStateDidFailLoading;
        }
    }
}

- (void)cancelLoading {
    [self deleteCachedImage];
    self.imageData = nil;
    self.image = nil;
    self.state = AVModelStateDidUnload;
}

#pragma mark -
#pragma mark Private

- (void)cacheImage:(UIImage *)image {
    BOOL result = [self.imageData writeToFile:[NSFileManager applicationDataFilePath:self.imageName] atomically:YES];
    NSLog(@"%i", result);
}

- (NSString *)deleteSymbol:(NSString *)symbol inString:(NSString *)string {
    return [string stringByReplacingOccurrencesOfString:symbol withString:@""];
}

- (NSString *)deleteSymbols:(NSArray *)symbols inString:(NSString *)string {
    for (NSString *symbol in symbols) {
        string = [self deleteSymbol:symbol inString:string];
    }
    
//    NSLog(@"%@", string);
    
    return string;
}

- (void)deleteCachedImage {
    [[NSFileManager defaultManager] removeItemAtPath:[NSFileManager applicationDataFilePath:self.imageName] error:nil];
}

@end
