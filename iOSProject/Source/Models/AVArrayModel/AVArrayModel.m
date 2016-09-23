//
//  AVArrayModel.m
//  iOSProject
//
//  Created by Aleksandr Voropaev on 9/12/16.
//  Copyright © 2016 Aleksandr Voropaev. All rights reserved.
//

#import "AVArrayModel.h"

#import "AVUser.h"

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
//
    self.changedObjectIndexPath = [NSIndexPath indexPathWithIndex:(self.count - 1)];
    self.state = AVArrayStateDidCreateObject;
}

- (void)insertObject:(id)object atIndex:(NSUInteger)index {
    [self.array insertObject:object atIndex:index];
}

- (void)addObjects:(NSArray *)objects {
    [self.array addObjectsFromArray:objects];
}

- (void)removeObject:(id)object {
    [self.array removeObject:object];
}

- (void)removeObjectAtIndex:(NSUInteger)index {
    [self.array removeObjectAtIndex:index];
//
    self.changedObjectIndexPath = [NSIndexPath indexPathWithIndex:index];
    self.state = AVArrayStateDidDeleteObject;
}

- (void)removeObjects:(NSArray *)objects {
    [self.array removeObjectsInArray:objects];
}

- (void)removeAll {
    [self.array removeObjectsInArray:self.array];
}

- (void)replaceAllObjectsWithObjects:(NSArray *)objects {
    @synchronized (self) {
        [self removeAll];
        [self addObjects:objects];
    }
}

- (void)moveObjectFromIndex:(NSUInteger)baseIndex toIndex:(NSUInteger)targetIndex {
    [self.array moveObjectFromIndex:baseIndex toIndex:targetIndex];
}

- (SEL)selectorForState:(NSUInteger)state {
    switch (state) {
        AVSwitchCase(AVArrayStateDidDeleteObject, { return @selector(AVArrayStateDidDeleteObject:); });
        AVSwitchCase(AVArrayStateDidCreateObject, { return @selector(AVArrayStateDidCreateObject:); });
        AVSwitchCase(AVArrayStateDidInsertObject, { return @selector(AVArrayStateDidInsertObject:); });
        AVSwitchCaseDefault({ return [super selectorForState:state]; })
    }
}

@end
