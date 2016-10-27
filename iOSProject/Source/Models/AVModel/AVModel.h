//
//  AVModel.h
//  iOSProject
//
//  Created by Aleksandr Voropaev on 10/18/16.
//  Copyright © 2016 Aleksandr Voropaev. All rights reserved.
//

#import "AVObservableObject.h"

typedef NS_ENUM(NSInteger, AVModelState) {
    AVModelStateDidUnload,
    AVModelStateWillLoad,
    AVModelStateDidLoad,
    AVModelStateDidFailLoading,
    AVModelStateCount
};

@class AVModel;

@protocol AVModelObserver <NSObject>
@optional
- (void)modelDidLoad:(AVModel *)model;
- (void)modelWillLoad:(AVModel *)model;
- (void)modelDidUnload:(AVModel *)model;
- (void)modelDidFailLoading:(AVModel *)model;

@end

@interface AVModel : AVObservableObject

- (void)load;
- (void)performLoading;

@end
