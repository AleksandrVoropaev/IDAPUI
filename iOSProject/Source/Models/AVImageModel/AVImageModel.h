//
//  AVImageModel.h
//  iOSProject
//
//  Created by Aleksandr Voropaev on 9/7/16.
//  Copyright © 2016 Aleksandr Voropaev. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "AVObservableObject.h"

typedef NS_ENUM(NSUInteger, AVImageModelState) {
    AVImageModelUnloaded,
    AVImageModelLoaded,
    AVImageModelLoading,
    AVImageModelFailedLoading,
};

//@protocol AVImageViewObserver <NSObject>
//
//@optional
//- (void)AVImageViewDidBecomeUnloaded;
//- (void)AVImageViewDidBecomeLoaded;
//- (void)AVImageViewDidBecomeLoading;
//- (void)AVImageViewDidBecomeFailedLoading;
//
//@end

@interface AVImageModel : AVObservableObject
@property (nonatomic, readonly)     UIImage     *image;
@property (nonatomic, readonly)     NSURL       *url;

+ (instancetype)imageWithURL:(NSURL *)url;

- (instancetype)initWithURL:(NSURL *)url;
- (void)load;
- (void)dump; //unload from RAM or/and save to hard drive
//- (void)cancel; duplicating ()dump

@end
