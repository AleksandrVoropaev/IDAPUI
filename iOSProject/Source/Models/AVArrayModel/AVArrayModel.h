//
//  AVArrayModel.h
//  iOSProject
//
//  Created by Aleksandr Voropaev on 9/12/16.
//  Copyright © 2016 Aleksandr Voropaev. All rights reserved.
//

#import "AVObservableObject.h"

typedef enum : NSUInteger {
    AVArraySortTypeAscending,
    AVArraySortTypeDescending,
} AVArraySortType;

@interface AVArrayModel : AVObservableObject
@property (nonatomic, readonly)   NSUInteger  count;

- (id)objectAtIndex:(NSUInteger)index;

- (void)addObject:(id)object;
- (void)addObject:(id)object atIndex:(NSUInteger)index;
- (void)addObjects:(NSArray *)objects;

- (void)removeObject:(id)object;
- (void)removeObjectAtIndex:(NSUInteger)index;
- (void)removeObjects:(NSArray *)objects;
- (void)removeAll;

- (void)sortedArrayWithType:(AVArraySortType)sortType;

@end
