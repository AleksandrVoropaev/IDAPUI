//
//  AVArrayModel.m
//  iOSProject
//
//  Created by Aleksandr Voropaev on 9/12/16.
//  Copyright © 2016 Aleksandr Voropaev. All rights reserved.
//

#import "AVArrayModel.h"

#import "AVUser.h"
#import "AVArrayChangesObject.h"

#import "NSMutableArray+AVExtensions.h"

#import "AVSwitchCaseMacro.h"

@interface AVArrayModel ()
@property (nonatomic, strong)   NSMutableArray  *array;

@end

@implementation AVArrayModel

@dynamic count;
@dynamic objects;

#pragma mark -
#pragma mark Initializations and Deallocations

- (instancetype)init {
    self = [super init];
    self.array = [NSMutableArray array];
    
    return self;
}

#pragma mark -
#pragma mark Accessors

- (NSUInteger)count {
    return self.array.count;
}

- (NSArray *)objects {
    return [self.array copy];
}

- (id)objectAtIndex:(NSUInteger)index {
    @synchronized (self) {
        return [self.array objectAtIndex:index];
    }
}

- (id)objectAtIndexedSubscript:(NSUInteger)index {
    @synchronized (self) {
        return [self.array objectAtIndexedSubscript:index];
    }
}

- (void)setObject:(id)object atIndexedSubscript:(NSUInteger)index {
    @synchronized (self) {
        [self.array setObject:object atIndexedSubscript:index];
    }
}

#pragma mark -
#pragma mark Public

// add/insert
- (void)insertObject:(id)object atIndex:(NSUInteger)index {
    @synchronized (self) {
        [self.array insertObject:object atIndex:index];
        AVArrayChangesObject *changes = [AVArrayChangesObject arrayChangedWithObject:object
                                                                               index:index
                                                                         changesType:AVArrayModelChangeDidInsertObject];
        [self notifyOfState:AVArrayModelChangeDidInsertObject withObject:changes];
    }
}

- (void)addObject:(id)object {
    [self insertObject:object atIndex:self.count];
}

- (void)addObjects:(NSArray *)objects {
    @synchronized (self) {
        for (id object in objects) {
            [self addObject:object];
        }
    }
}

// remove
- (void)removeObjectAtIndex:(NSUInteger)index {
    @synchronized (self) {
        id object = self.array[index];
        [self.array removeObjectAtIndex:index];
        AVArrayChangesObject *changes = [AVArrayChangesObject arrayChangedWithObject:object
                                                                               index:index
                                                                         changesType:AVArrayModelChangeDidDeleteObject];
        [self notifyOfState:AVArrayModelChangeDidDeleteObject withObject:changes];
    }
}

- (void)removeObject:(id)object {
    @synchronized (self) {
        if (![self.array containsObject:object]) {
            return;
        }
        
        [self removeObjectAtIndex:[self.array indexOfObject:object]];
    }
}

- (void)removeObjects:(NSArray *)objects {
    @synchronized (self) {
        for (id object in objects) {
            [self removeObject:object];
        }
    }
}

- (void)removeAll {
    @synchronized (self) {
        NSUInteger count = self.count;
        for (NSUInteger iterator = 0; iterator < count; iterator++) {
            [self removeObjectAtIndex:(count - iterator - 1)];
        }
    }
}

- (void)replaceAllObjectsWithObjects:(NSArray *)objects {
    @synchronized (self) {
        [self removeAll];
        [self addObjects:objects];
    }
}

- (void)moveObjectFromIndex:(NSUInteger)baseIndex toIndex:(NSUInteger)targetIndex {
    @synchronized (self) {
        [self.array moveObjectFromIndex:baseIndex toIndex:targetIndex];
        AVArrayChangesObject *changes = [AVArrayChangesObject arrayChangedWithObject:[self objectAtIndex:baseIndex]
                                                                               index:baseIndex
                                                                         targetIndex:targetIndex
                                                                         changesType:AVArrayModelChangeDidMoveObject];
        [self notifyOfState:AVArrayModelChangeDidMoveObject withObject:changes];
    }
}

#pragma mark -
#pragma mark Observation

- (SEL)selectorForState:(NSUInteger)state {
    @synchronized (self) {
        return @selector(arrayModel:didChange:);
//        switch (state) {
//            AVSwitchCase(AVArrayModelChangeDidDeleteObject, { return @selector(arrayModel:didChange:); });
//            AVSwitchCase(AVArrayModelChangeDidInsertObject, { return @selector(arrayModel:didChange:); });
//            AVSwitchCaseDefault({ return [super selectorForState:state]; })
//        }
    }
}

@end
