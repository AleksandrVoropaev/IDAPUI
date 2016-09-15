//
//  AVArrayModel.h
//  iOSProject
//
//  Created by Aleksandr Voropaev on 9/12/16.
//  Copyright © 2016 Aleksandr Voropaev. All rights reserved.
//

#import "AVObservableObject.h"

typedef NS_ENUM(NSUInteger, AVArrayState) {
    AVArrayStateDidChange
};

@interface AVArrayModel : AVObservableObject
@property (nonatomic, readonly)   NSUInteger  count;

- (id)objectAtIndex:(NSUInteger)index;
- (id)objectAtIndexedSubscript:(NSUInteger)index;

- (void)addObject:(id)object;
- (void)addObject:(id)object atIndex:(NSUInteger)index;
- (void)addObjects:(NSArray *)objects;
- (void)setObject:(id)object atIndexedSubscript:(NSUInteger)index;

- (void)removeObject:(id)object;
- (void)removeObjectAtIndex:(NSUInteger)index;
- (void)removeObjects:(NSArray *)objects;
- (void)removeAll;

- (void)moveObjectFromIndex:(NSUInteger)baseIndex toIndex:(NSUInteger)targetIndex;

@end
