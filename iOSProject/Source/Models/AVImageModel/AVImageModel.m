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
//    NSURL *url = [[NSBundle mainBundle] URLForResource:kImageFileName withExtension:kImageFileExtension];
    NSString *path = [[NSBundle mainBundle] pathForResource:self.imageName ofType:@"png"];
    UIImage *image = [UIImage imageWithContentsOfFile:path];
    if (!image) {
        //
        
//        dispatch_queue_t myqueue = dispatch_queue_create("myqueue", NULL);
//        
//        // execute a task on that queue asynchronously
//        dispatch_async(myqueue, ^{
//            NSURL *url = [NSURL URLWithString:[urlstring stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];;
//            NSData *data = [NSData dataWithContentsOfURL:url];
//            dispatch_async(dispatch_get_main_queue(), ^{
//                Image.image = [UIImage imageWithData:data]; //UI updates should be done on the main thread
//            });
//        });

        
        //
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
