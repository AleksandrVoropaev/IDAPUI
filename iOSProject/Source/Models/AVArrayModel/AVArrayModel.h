//
//  AVArrayModel.h
//  iOSProject
//
//  Created by Aleksandr Voropaev on 9/12/16.
//  Copyright © 2016 Aleksandr Voropaev. All rights reserved.
//

#import "AVObservableObject.h"

#import "AVModel.h"

typedef NS_ENUM(NSUInteger, AVArrayModelState) {
    AVArrayModelStateDidChangeWithChangesObject,
};

@class AVArrayChangesObject;
@class AVArrayModel;

@protocol AVArrayModelObserver <NSObject>

@optional
- (void)arrayModel:(AVArrayModel *)model didChangeWithChangesObject:(AVArrayChangesObject *)changes;

@end

@interface AVArrayModel : AVModel
@property (nonatomic, readonly)     NSUInteger  count;
@property (nonatomic, readonly)     NSArray     *objects;
@property (nonatomic, strong)       NSIndexPath *changedObjectIndexPath;

- (id)objectAtIndex:(NSUInteger)index;
- (id)objectAtIndexedSubscript:(NSUInteger)index;

- (void)addObject:(id)object;
- (void)insertObject:(id)object atIndex:(NSUInteger)index;
- (void)addObjects:(NSArray *)objects;
- (void)setObject:(id)object atIndexedSubscript:(NSUInteger)index;

- (void)removeObject:(id)object;
- (void)removeObjectAtIndex:(NSUInteger)index;
- (void)removeObjects:(NSArray *)objects;
- (void)removeAll;

- (void)replaceAllObjectsWithObjects:(NSArray *)objects;

- (void)moveObjectFromIndex:(NSUInteger)baseIndex toIndex:(NSUInteger)targetIndex;

@end
