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
    
//    NSString *path = [[NSBundle mainBundle] pathForResource:@"image" ofType:@"jpeg"];
//    UIImage *image = [UIImage imageWithContentsOfFile:path];
    UIImage *image = [NSKeyedUnarchiver unarchiveObjectWithFile:[NSFileManager applicationDataFilePath:self.imageName]];
    if (image) {
        self.image = image;
    } else {
        AVDispatchAsyncBlockOnDefaultPriorityQueue(^{
//            [NSURLSession]
            [NSURL];
        })
    }
}

- (void)performLoadingWithCompletionHandler:(void (^)(UIImage *, id))completion {
    
}

- (void)finalizeLoadingImage:(UIImage *)image error:(id)error {
    self.image = image;
    self.state = image ? AVModelStateLoaded : AVModelStateFailedLoading;
}

- (void)dump {
    UIImage *image = [NSKeyedUnarchiver unarchiveObjectWithFile:[NSFileManager applicationDataFilePath:self.imageName]];
//    
//    if (!image) {
//        image = [NSData]
//    }
    
    sleep(5);
    self.state = AVModelStateLoaded;
}

#pragma mark -
#pragma mark Private


@end
