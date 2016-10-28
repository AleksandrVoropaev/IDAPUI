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

@interface AVImageModel ()
@property (nonatomic, strong)   UIImage     *image;
@property (nonatomic, strong)   NSString    *imageName;
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

- (instancetype)initWithURL:(NSURL *)url {
    self = [super init];
    self.url = url;
    
    return self;
}

#pragma mark -
#pragma mark Accessors

- (NSString *)imageName {
    NSString *path = self.url.absoluteString;
    NSLog(@"%@", path);
    
    NSCharacterSet *characters = [NSCharacterSet URLPathAllowedCharacterSet];
    NSString *pathWithEncoding = [self.url.absoluteString stringByAddingPercentEncodingWithAllowedCharacters:characters];
    NSLog(@"%@", pathWithEncoding);
    NSString *pathWithoutSlashes = [self.url.absoluteString stringByReplacingOccurrencesOfString:@"/" withString:@""];
    NSLog(@"%@", pathWithoutSlashes);

    NSString *pathExtension = self.url.pathExtension;
    NSLog(@"%@", pathExtension);
    NSString *lastPathComponentWithoutExt = self.url.lastPathComponent.stringByDeletingPathExtension;
    NSLog(@"%@", lastPathComponentWithoutExt);

    return pathWithoutSlashes;
}
#pragma mark -
#pragma mark Public

- (void)performLoading {
    NSString *path = [[NSBundle mainBundle] pathForResource:self.imageName ofType:@"png"];
    UIImage *image = [UIImage imageWithContentsOfFile:path];
    if (!image) {
        image = [UIImage imageWithData:[NSData dataWithContentsOfURL:self.url]];
    }
    
    if (image) {
        self.image = image;
        [self cacheImage:image];
        self.state = AVModelStateDidLoad;
    } else {
        self.state = AVModelStateDidFailLoading;
    }
}

#pragma mark -
#pragma mark Private

- (void)cacheImage:(UIImage *)image {
    NSData *imageData = UIImagePNGRepresentation(image);
    NSString *str = [NSFileManager applicationDataFilePath:[self imageName]];
    NSLog(@"%@", str);

    BOOL result = [imageData writeToFile:[NSFileManager applicationDataFilePath:[self imageName]] atomically:YES];
    NSLog(@"%i", result);
}

@end
