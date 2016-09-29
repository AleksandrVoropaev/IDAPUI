//
//  AVArrayModel.h
//  iOSProject
//
//  Created by Aleksandr Voropaev on 9/12/16.
//  Copyright © 2016 Aleksandr Voropaev. All rights reserved.
//

#import "AVObservableObject.h"

@class AVArrayChangesObject;

typedef NS_ENUM(NSUInteger, AVArrayModelChange) {
    AVArrayModelChangeDidDeleteObject,
    AVArrayModelChangeDidInsertObject,
    AVArrayModelChangeDidMoveObject
};

@protocol AVArrayModelObserver <NSObject>

@optional
- (void)arrayModelDidChange:(AVArrayChangesObject *)change;

@end

@interface AVArrayModel : AVObservableObject
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
