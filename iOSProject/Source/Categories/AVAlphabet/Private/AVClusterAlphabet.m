//
//  AVClusterAlphabet.m
//  ObjectiveC
//
//  Created by Aleksandr Voropaev on 7/14/16.
//  Copyright © 2016 Aleksandr Voropaev. All rights reserved.
//

#import "AVClusterAlphabet.h"

@interface AVClusterAlphabet ()
@property (nonatomic, retain)   NSArray     *alphabets;
@property (nonatomic, assign)   NSUInteger  count;

- (NSUInteger)countWithAlphabets:(NSArray *)alphabets;

@end

@implementation AVClusterAlphabet

#pragma mark -
#pragma mark Initializations and Deallocations

- (void)dealloc {
    self.alphabets = nil;
    
    [super dealloc];
}

- (instancetype)initWithAlphabets:(NSArray *)alphabets {
    self = [super init];
    if (self) {
        self.alphabets = alphabets;
        self.count = [self countWithAlphabets:self.alphabets];
    }
    
    return self;
}

#pragma mark -
#pragma mark Public

- (NSString *)stringAtIndex:(NSUInteger)index {
    NSUInteger count = self.count;
    
    NSAssert(index < count, NSRangeException);
    
    for (AVAlphabet *alphabet in self.alphabets) {
        if (index <= alphabet.count) {
            return alphabet[index];
        } else {
            index -= alphabet.count;
        }
    }
    
    return nil;
}

- (NSString *)string {
    NSMutableString *string = [NSMutableString stringWithCapacity:[self count]];
    for (AVAlphabet *alphabet in self.alphabets) {
        [string appendString:[alphabet string]];
    }
    
    return [[string copy] autorelease];
}

#pragma mark -
#pragma mark Private

- (NSUInteger)countWithAlphabets:(NSArray *)alphabets {
    NSUInteger count = 0;
    for (AVAlphabet *alphabet in alphabets) {
        count += [alphabet count];
    }
    
    return count;
}

@end
