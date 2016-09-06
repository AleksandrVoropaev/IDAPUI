//
//  AVAlphabet.h
//  ObjectiveC
//
//  Created by Aleksandr Voropaev on 7/14/16.
//  Copyright © 2016 Aleksandr Voropaev. All rights reserved.
//

#import <Foundation/Foundation.h>

extern
NSRange AVMakeAlphabetRange(unichar firstChar, unichar secondChar);

@interface AVAlphabet : NSObject <NSFastEnumeration>

+ (instancetype)alphabetWithRange:(NSRange)range;
+ (instancetype)alphabetWithSymbols:(NSString *)symbols;
+ (instancetype)alphabetWithStrings:(NSArray *)strings;
+ (instancetype)alphabetWithAlphabets:(NSArray *)alphabets;

+ (instancetype)alphanumericAlphabet;
+ (instancetype)numericAlphabet;
+ (instancetype)lowercaseAlphabet;
+ (instancetype)uppercaseAlphabet;
+ (instancetype)letterAlphabet;

- (instancetype)initWithRange:(NSRange)range;
- (instancetype)initWithSymbols:(NSString *)symbols;
- (instancetype)initWithStrings:(NSArray *)strings;
- (instancetype)initWithAlphabets:(NSArray *)alphabets;

- (NSUInteger)count;
- (NSString *)stringAtIndex:(NSUInteger)index;
- (NSString *)objectAtIndexedSubscript:(NSUInteger)index;

- (NSString *)string;

@end
