//
//  AVAlphabet.m
//  ObjectiveC
//
//  Created by Aleksandr Voropaev on 7/14/16.
//  Copyright © 2016 Aleksandr Voropaev. All rights reserved.
//

#import "AVAlphabet.h"

#import <math.h>

#import "AVRangeAlphabet.h"
#import "AVClusterAlphabet.h"
#import "AVStringsAlphabet.h"

#import "NSString+AVExtensions.h"

NSRange AVMakeAlphabetRange(unichar firstChar, unichar secondChar) {
    return NSMakeRange(MIN(firstChar, secondChar),
                       MAX(firstChar, secondChar) - MIN(firstChar, secondChar) + 1);
}

@implementation AVAlphabet

#pragma mark -
#pragma mark Class methods

+ (instancetype)alphabetWithRange:(NSRange)range {
    return [[[AVRangeAlphabet alloc] initWithRange:range] autorelease];
}

+ (instancetype)alphabetWithSymbols:(NSString *)symbols {
    return [self alphabetWithStrings:[symbols symbols]];
}

+ (instancetype)alphabetWithStrings:(NSArray *)strings {
    return [[[AVStringsAlphabet alloc] initWithStrings:strings] autorelease];
}

+ (instancetype)alphabetWithAlphabets:(NSArray *)alphabets {
    return [[[AVClusterAlphabet alloc] initWithAlphabets:alphabets] autorelease];
}

+ (instancetype)alphanumericAlphabet {
    NSMutableString *alphanumericAlphabet = [NSMutableString stringWithString:[self letterAlphabet]];
    [alphanumericAlphabet appendString:[self numericAlphabet]];
    
    return [self alphabetWithSymbols:alphanumericAlphabet];
}

+ (instancetype)numericAlphabet {
    return [self alphabetWithRange:NSMakeRange('0', 10)];
}

+ (instancetype)lowercaseAlphabet {
    return [self alphabetWithRange:NSMakeRange('a', 'z' - 'a')];
}

+ (instancetype)uppercaseAlphabet {
    return [self alphabetWithRange:NSMakeRange('A', 'Z' - 'A')];
}

+ (instancetype)letterAlphabet {
    NSMutableString *letterAlphabet = [NSMutableString stringWithString:[self lowercaseAlphabet]];
    [letterAlphabet appendString:[self uppercaseAlphabet]];
    
    return [self alphabetWithSymbols:letterAlphabet];
}

#pragma mark -
#pragma mark Initializations and Deallocations

- (instancetype)initWithRange:(NSRange)range {
    [self release];
    
    return [[AVRangeAlphabet alloc] initWithRange:range];
}

- (instancetype)initWithSymbols:(NSString *)symbols {
    [self release];
    
    return [[AVStringsAlphabet alloc] initWithStrings:[symbols symbols]];
}

- (instancetype)initWithStrings:(NSArray *)strings {
    [self release];
    
    return [[AVStringsAlphabet alloc] initWithStrings:strings];
}

- (instancetype)initWithAlphabets:(NSArray *)alphabets {
    [self release];
    
    return [[AVClusterAlphabet alloc] initWithAlphabets:alphabets];
}

#pragma mark -
#pragma mark NSArray methods = Public

- (NSUInteger)count {
    [self doesNotRecognizeSelector:_cmd];

    return 0;
}

- (NSString *)stringAtIndex:(NSUInteger)index {
    [self doesNotRecognizeSelector:_cmd];

    return nil;
}

- (id)objectAtIndexedSubscript:(NSUInteger)index {
    return [self stringAtIndex:index];
}

- (NSString *)string {
    NSMutableString *string = [NSMutableString stringWithCapacity:[self count]];
    for (NSString *symbol in self) {
        [string appendString:symbol];
    }
    
    return [[string copy] autorelease];
}

#pragma mark -
#pragma mark NSFastEnumeration

- (NSUInteger)countByEnumeratingWithState:(NSFastEnumerationState *)state
                                  objects:(id _Nonnull [])stackbuf
                                    count:(NSUInteger)len
{
    state->mutationsPtr = (unsigned long *)self;
    
    NSUInteger length = MIN(state->state + len, [self count]);
    len = length - state->state;
    
    if (0 != len) {
        for (NSUInteger index = 0; index < len; index++) {
            stackbuf[index] = self[index + state->state];
        }
    }
    
    state->itemsPtr = stackbuf;
    
    state->state += len;
    
    return len;
}

@end
