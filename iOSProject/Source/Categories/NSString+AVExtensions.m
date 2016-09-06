//
//  NSMutableString+AVExtentions.m
//  ObjectiveC
//
//  Created by Aleksandr Voropaev on 6/27/16.
//  Copyright © 2016 Aleksandr Voropaev. All rights reserved.
//

#import "AVAlphabet.h"

#import "NSString+AVExtensions.h"

#import "AVRandom.h"

static const NSUInteger kNSStringRandomStringDefaultMaxLength = 30;

@implementation NSMutableString (AVExtensions)

+ (instancetype)randomString {
    return [self randomStringWithLength:arc4random_uniform(kNSStringRandomStringDefaultMaxLength)];
}

+ (instancetype)randomStringWithLength:(NSUInteger)length {
    AVAlphabet *alphanumericAlphabet = [AVAlphabet alphanumericAlphabet];
    
    return [self randomStringWithLength:length alphabet:alphanumericAlphabet];
}

+ (instancetype)randomStringWithLength:(NSUInteger)length alphabet:(AVAlphabet *)alphabet {
    NSMutableString *string = [NSMutableString stringWithCapacity:length];
    for (NSUInteger index = 0; index < length; index++) {
        [string appendFormat:@"%@", [alphabet stringAtIndex:(AVRandomWithValue((uint32_t)[alphabet count]))]];
    }

    return [self stringWithString:string];
}

- (NSArray *)symbols {
    NSMutableArray *symbols = [NSMutableArray arrayWithCapacity:[self length]];
    for (NSUInteger index = 0; index < [self length]; index++) {
        [symbols addObject:[NSString stringWithFormat:@"%c", [self characterAtIndex:index]]];
    }
    
    return [symbols copy];
}

@end
