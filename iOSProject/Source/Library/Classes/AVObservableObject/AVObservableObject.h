//
//  AVObservableObject.h
//  ObjectiveC
//
//  Created by Aleksandr Voropaev on 7/18/16.
//  Copyright © 2016 Aleksandr Voropaev. All rights reserved.
//

#import "AVAlphabet.h"

@interface AVObservableObject : NSObject
@property (nonatomic, assign)   NSUInteger  state;
@property (nonatomic, readonly) NSSet       *observerSet;

- (void)addObserver:(id)observer;
- (void)addObservers:(NSArray *)observers;
- (void)removeObserver:(id)observer;
- (void)removeObservers:(NSArray *)observers;
- (BOOL)isObservedByObject:(id)observer;

- (void)setState:(NSUInteger)state withObject:(id)object;
- (void)notifyOfState:(NSUInteger)state;
- (void)notifyOfState:(NSUInteger)state withObject:(id)object;

//This method is intended for subclassing. Never call it directly!
- (SEL)selectorForState:(NSUInteger)state;

@end
