//
//  AVObservableObject.m
//  ObjectiveC
//
//  Created by Aleksandr Voropaev on 7/18/16.
//  Copyright © 2016 Aleksandr Voropaev. All rights reserved.
//

#import "AVObservableObject.h"

@interface AVObservableObject ()
@property (nonatomic, retain)   NSMutableSet    *mutableObserverSet;
@property (nonatomic, assign)   BOOL            notifying;

- (void)notifyOfStateChangewithSelector:(SEL)selector;

@end

@implementation AVObservableObject

@dynamic observerSet;

#pragma mark -
#pragma mark Initializations and Deallocations

- (void)dealloc {
    self.mutableObserverSet = nil;
}

- (instancetype)init {
    self = [super init];
    self.mutableObserverSet = [NSMutableSet set];
    self.notifying = YES;
    
    return self;
}

#pragma mark -
#pragma mark Accessors

- (NSSet *)observerSet {
    @synchronized (self) {
        return [self.mutableObserverSet copy];
    }
}

- (void)setState:(NSUInteger)state {
    @synchronized (self) {
        if (state != _state) {
            _state = state;
            
            if (!self.notifying) {
                return;
            }

            [self notifyOfStateChangewithSelector:[self selectorForState:state]];
        }
    }
}

- (void)setState:(NSUInteger)state withObject:(id)object {
    @synchronized (self) {
        if (state != _state) {
            _state = state;
            
            if (!self.notifying) {
                return;
            }

            [self notifyOfState:state withObject:object];
        }
    }
}

- (void)notifyOfState:(NSUInteger)state {
    [self notifyOfState:state withObject:nil];
}

- (void)notifyOfState:(NSUInteger)state withObject:(id)object {
    @synchronized (self) {
        [self notifyOfStateChangewithSelector:[self selectorForState:state] object:object];
    }
}

#pragma mark -
#pragma mark Public

- (void)addObserver:(id)observer {
    @synchronized (self) {
        [self.mutableObserverSet addObject:observer];
    }
}

- (void)addObservers:(NSArray *)observers {
    for (id observer in observers) {
        [self addObserver:observer];
    }
}

- (void)removeObserver:(id)observer {
    @synchronized (self) {
        [self.mutableObserverSet removeObject:observer];
    }
}

- (void)removeObservers:(NSArray *)observers {
    for (id observer in observers) {
        [self addObserver:observer];
    }
}

- (BOOL)isObservedByObject:(id)observer {
    @synchronized (self) {
        return [self.mutableObserverSet containsObject:observer];
    }
}

- (void)performBlockWithNotifications:(void(^)(void))block {
    [self performBlock:block notifying:YES];
}

- (void)performBlockWitouthNotifications:(void(^)(void))block {
    [self performBlock:block notifying:NO];
}

- (void)performBlock:(void (^)(void))block notifying:(BOOL)notifying {
    BOOL baseNotifyingStatus = self.notifying;
    
    self.notifying = notifying;
    block();
    self.notifying = baseNotifyingStatus;
}

#pragma mark -
#pragma mark Private

- (SEL)selectorForState:(NSUInteger)state {    
    return NULL;
}

- (void)notifyOfStateChangewithSelector:(SEL)selector {
    [self notifyOfStateChangewithSelector:selector object:nil];
//    NSMutableSet *observerSet = self.mutableObserverSet;
//    for (id observer in observerSet) {
//        if ([observer respondsToSelector:selector]) {
//            [observer performSelector:selector withObject:self];
//        }
//    }
}

- (void)notifyOfStateChangewithSelector:(SEL)selector object:(id)object {
    NSMutableSet *observerSet = self.mutableObserverSet;
    for (id observer in observerSet) {
        if ([observer respondsToSelector:selector]) {
            [observer performSelector:selector withObject:self withObject:object];
        }
    }
}

@end
