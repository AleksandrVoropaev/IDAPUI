//
//  AVModel.h
//  iOSProject
//
//  Created by Aleksandr Voropaev on 10/18/16.
//  Copyright © 2016 Aleksandr Voropaev. All rights reserved.
//

#import "AVObservableObject.h"

typedef NS_ENUM(NSInteger, AVModelState) {
    AVModelStateLoaded,
    AVModelStateLoading,
    AVModelStateNotLoaded,
    AVModelStateFailedLoading,
    AVModelStateCount
};

@protocol AVModelObserver <NSObject>
@optional
- (void)modelDidLoaded;
- (void)modelIsLoading;
- (void)modelNotLoaded;
- (void)modelDidFailedLoading;

@end

@interface AVModel : AVObservableObject

- (void)load;
- (void)save;

@end
