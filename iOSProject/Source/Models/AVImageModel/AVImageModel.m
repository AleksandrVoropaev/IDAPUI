//
//  AVImageModel.m
//  iOSProject
//
//  Created by Aleksandr Voropaev on 9/7/16.
//  Copyright © 2016 Aleksandr Voropaev. All rights reserved.
//

#import "AVImageModel.h"

#import "AVImageModelDispatcher.h"

#import "AVWeakifyStrongify.h"

@interface AVImageModel ()
@property (nonatomic, strong) UIImage       *image;
@property (nonatomic, strong) NSURL         *url;
@property (nonatomic, strong) NSOperation   *operation;

- (NSOperation *)imageLoadingOperation;

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
    self.operation = nil;
}

- (instancetype)initWithURL:(NSURL *)url {
    self = [super init];
    if (self) {
        self.url = url;
    }
    
    return self;
}

#pragma mark -
#pragma mark Accessors

- (void)setOperation:(NSOperation *)operation {
    if (_operation != operation) {
        [_operation cancel];
        
        _operation = operation;
        
        if (operation) {
            [[[AVImageModelDispatcher sharedDispatcher] queue] addOperation:operation];
        }
    }
}

#pragma mark -
#pragma mark Public

- (void)load {
    @synchronized (self) {
        if (AVImageModelLoading == self.state) {
            return;
        }
        
        if (AVImageModelLoaded == self.state) {
            [self notifyOfState:AVImageModelLoaded];
            return;
        }
        
        self.state = AVImageModelLoading;
    }
    
    self.operation = [self imageLoadingOperation];
}

- (void)dump {
    self.operation = nil;
    self.image = nil;
    self.state = AVImageModelUnloaded;
}

#pragma mark -
#pragma mark Private

- (NSOperation *)imageLoadingOperation {
    AVWeakify(self)
//    __weak AVImageModel *weakSelf = self;
    
    NSBlockOperation *operation = [NSBlockOperation blockOperationWithBlock:^{
        AVStrongify(self)
        self.image = [UIImage imageWithContentsOfFile:[self.url absoluteString]];
//        __strong AVImageModel *strongSelf = weakSelf;
//        strongSelf.image = [UIImage imageWithContentsOfFile:[strongSelf.url absoluteString]];
    }];
    
    operation.completionBlock = ^{
        AVStrongify(self);
//        __strong AVImageModel *strongSelf = weakSelf;
        @synchronized (self) {
//        @synchronized (strongSelf) {
            self.state = self.image ? AVImageModelLoaded : AVImageModelFailedLoading;
//            strongSelf.state = strongSelf.image ? AVImageModelLoaded : AVImageModelFailedLoading;
        }
    };

    return operation;
}

@end
