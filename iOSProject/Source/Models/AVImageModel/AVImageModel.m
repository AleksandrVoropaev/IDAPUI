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
    return self.url.path;
}
#pragma mark -
#pragma mark Public

- (void)performLoading {
//    AVWeakify(self);
//    [self performLoadingWithCompletionHandler:^(UIImage *image, id error) {
//        AVStrongifyAndReturnIfNil(self);
//        
//        [self finalizeLoadingImage:image error:error];
//    }];
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"userImage" ofType:@"png"];
    UIImage *image = [UIImage imageWithContentsOfFile:path];
    if (!image) {
        image = [UIImage imageWithData:[NSData dataWithContentsOfURL:self.url]];
    }
    
    if (image) {
        self.image = image;
        self.state = AVModelStateDidLoad;
    } else {
        self.state = AVModelStateDidFailLoading;
    }
}

#pragma mark -
#pragma mark Private


@end
