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

@implementation NSString (AVExtensions)

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

+ (NSString *)fileNameWithURL:(NSURL *)url {
    NSCharacterSet *characters = [NSCharacterSet URLPathAllowedCharacterSet];
    NSString *path = [url.absoluteString stringByAddingPercentEncodingWithAllowedCharacters:characters];
    
    return path;
}

+ (NSString *)fileNameWithoutExtensionWithURL:(NSURL *)url {
    return [self fileNameWithURL:url].stringByDeletingPathExtension;
}

- (instancetype)deleteSymbol:(NSString *)symbol {
    return [self stringByReplacingOccurrencesOfString:symbol withString:@""];
}

- (instancetype)deleteSymbols:(NSArray *)symbols {
    id result = self;
    for (NSString *symbol in symbols) {
        result = [result deleteSymbol:symbol];
    }
    
    return result;
}

@end
