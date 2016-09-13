//
//  AVArrayModel.m
//  iOSProject
//
//  Created by Aleksandr Voropaev on 9/12/16.
//  Copyright © 2016 Aleksandr Voropaev. All rights reserved.
//

#import "AVArrayModel.h"

#import "AVUser.h"

#import "AVSwitchCaseMacro.h"

@interface AVArrayModel ()
@property (nonatomic, strong)   NSMutableArray  *array;

@end

@implementation AVArrayModel

@dynamic count;

- (instancetype)init {
    self = [super init];
    self.array = [NSMutableArray array];
    
    return self;
}

- (NSUInteger)count {
    return self.array.count;
}

- (id)objectAtIndex:(NSUInteger)index {
    return [self.array objectAtIndex:index];
}

- (id)objectAtIndexedSubscript:(NSUInteger)index {
    return [self.array objectAtIndexedSubscript:index];
}

- (void)setObject:(id)object atIndexedSubscript:(NSUInteger)index {
    [self.array setObject:object atIndexedSubscript:index];
}

- (void)addObject:(id)object {
    [self.array addObject:object];
}

- (void)addObject:(id)object atIndex:(NSUInteger)index {
    NSMutableArray *result = [NSMutableArray array];
    for (NSUInteger iterator = 0; iterator < index + 1; iterator++) {
        id obj = [self.array objectAtIndex:iterator];
        [result addObject:obj];
    }

    [result addObject:object];
    
    for (NSUInteger iterator = index + 1; iterator < self.array.count; iterator++) {
        [result addObject:[self.array objectAtIndex:iterator]];
    }

    self.array = result;
//    [self.array insertObject:object atIndex:index];
}

- (void)addObjects:(NSArray *)objects {
    [self.array addObjectsFromArray:objects];
}

- (void)removeObject:(id)object {
    [self.array removeObject:object];
}

- (void)removeObjectAtIndex:(NSUInteger)index {
    [self.array removeObjectAtIndex:index];
}

- (void)removeObjects:(NSArray *)objects {
    [self.array removeObjectsInArray:objects];
}

- (void)removeAll {
    [self.array removeObjectsInArray:self.array];
}

- (void)moveObjectFromIndex:(NSUInteger)baseIndex toIndex:(NSUInteger)targetIndex {
    [self addObject:[self objectAtIndex:baseIndex] atIndex:targetIndex];
    [self removeObjectAtIndex:baseIndex];
}

- (void)sortArrayWithType:(AVArraySortType)sortType {
    NSArray *result = nil;
    switch (sortType) {
        AVSwitchCase(AVArraySortTypeAscending, { result = [self.array sortedArrayUsingComparator:^NSComparisonResult(AVUser *firstUser, AVUser *secondUser) {
            NSString *firstSurname = firstUser.surname;
            NSString *secondSurname = secondUser.surname;
            return [firstSurname compare:secondSurname];
        }]; });
        AVSwitchCase(AVArraySortTypeDescending, { result = [self.array sortedArrayUsingComparator:^NSComparisonResult(AVUser *firstUser, AVUser *secondUser) {
            NSString *firstSurname = firstUser.surname;
            NSString *secondSurname = secondUser.surname;
            return [secondSurname compare:firstSurname];
        }]; });

        AVSwitchCaseDefault({});
    }
    
    [self removeAll];
    [self.array addObjectsFromArray:result];
}

- (SEL)selectorForState:(NSUInteger)state {
    switch (state) {
        AVSwitchCase(AVArrayStateDidChanged, { return @selector(arrayDidChanged); });
        AVSwitchCaseDefault({ return [super selectorForState:state]; })
    }
}

@end
