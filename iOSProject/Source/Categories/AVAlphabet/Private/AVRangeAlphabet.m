//
//  AVRangeAlphabet.m
//  ObjectiveC
//
//  Created by Aleksandr Voropaev on 7/14/16.
//  Copyright © 2016 Aleksandr Voropaev. All rights reserved.
//

#import "AVRangeAlphabet.h"

@interface AVRangeAlphabet ()
@property (nonatomic, assign) NSRange range;

@end

@implementation AVRangeAlphabet

#pragma mark -
#pragma mark Initializations and Deallocations

- (instancetype)initWithRange:(NSRange)range {
    self = [super init];
    if (self) {
        self.range = range;
    }
    
    return self;
}

#pragma mark -
#pragma mark Public

- (NSUInteger)count {
    return self.range.length;
}

- (NSString *)stringAtIndex:(NSUInteger)index {
    NSRange range = self.range;
    
    NSAssert(index < range.length, NSRangeException);
    
    return [NSString stringWithFormat:@"%c", (unichar)(range.location + index)];
}

@end
