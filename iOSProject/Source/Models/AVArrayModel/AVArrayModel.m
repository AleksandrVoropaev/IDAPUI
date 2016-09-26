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

- (instancetype)init {
    self = [super init];
    self.array = [NSMutableArray array];
    
    return self;
}

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

- (void)addObject:(id)object {
    @synchronized (self) {
        [self.array addObject:object];
        AVArrayChangesObject *changes = [AVArrayChangesObject arrayChangedWithObject:object
                                                        baseIndex:[NSIndexPath indexPathWithIndex:(self.count - 1)]
                                                                    destinationIndex:nil
                                                                           arraySate:AVArrayStateDidCreateObject];
        [self notifyOfState:AVArrayStateDidCreateObject withObject:changes];
    }
}

- (void)insertObject:(id)object atIndex:(NSUInteger)index {
    @synchronized (self) {
        [self.array insertObject:object atIndex:index];
        AVArrayChangesObject *changes = [AVArrayChangesObject arrayChangedWithObject:object
                                                        baseIndex:[NSIndexPath indexPathWithIndex:index]
                                                                    destinationIndex:nil
                                                                           arraySate:AVArrayStateDidInsertObject];
        [self notifyOfState:AVArrayStateDidInsertObject withObject:changes];
    }
}

- (void)addObjects:(NSArray *)objects {
    @synchronized (self) {
        [self.array addObjectsFromArray:objects];
    }
}

- (void)removeObject:(id)object {
    @synchronized (self) {
        [self.array removeObject:object];
    }
}

- (void)removeObjectAtIndex:(NSUInteger)index {
    @synchronized (self) {
        id object = [self.array objectAtIndex:index];
        [self.array removeObjectAtIndex:index];
        AVArrayChangesObject *changes = [AVArrayChangesObject arrayChangedWithObject:object
                                                            baseIndex:[NSIndexPath indexPathWithIndex:index]
                                                                    destinationIndex:nil
                                                                           arraySate:AVArrayStateDidDeleteObject];
        [self notifyOfState:AVArrayStateDidDeleteObject withObject:changes];
    }
}

- (void)removeObjects:(NSArray *)objects {
    @synchronized (self) {
        [self.array removeObjectsInArray:objects];
    }
}

- (void)removeAll {
    @synchronized (self) {
        [self.array removeObjectsInArray:self.array];
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
    }
}

- (SEL)selectorForState:(NSUInteger)state {
    @synchronized (self) {
        switch (state) {
                AVSwitchCase(AVArrayStateDidDeleteObject, { return @selector(arrayModel:didDeleteObjectAtIndex:); });
                AVSwitchCase(AVArrayStateDidCreateObject, { return @selector(arrayModel:didCreateObjectAtIndex:); });
                AVSwitchCase(AVArrayStateDidInsertObject, { return @selector(arrayModel:didInsertObjectAtIndex:); });
                AVSwitchCaseDefault({ return [super selectorForState:state]; })
        }
    }
}

@end
