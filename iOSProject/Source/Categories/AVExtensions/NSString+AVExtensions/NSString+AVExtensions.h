//
//  NSMutableString+AVExtentions.h
//  ObjectiveC
//
//  Created by Aleksandr Voropaev on 6/27/16.
//  Copyright © 2016 Aleksandr Voropaev. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "AVAlphabet.h"

@interface NSString (AVExtensions)

+ (instancetype)randomString;
+ (instancetype)randomStringWithLength:(NSUInteger)length;
+ (instancetype)randomStringWithLength:(NSUInteger)length alphabet:(AVAlphabet *)alphabet;
+ (NSString *)fileNameWithURL:(NSURL *)url;
+ (NSString *)fileNameWithoutExtensionWithURL:(NSURL *)url;

- (instancetype)deleteSymbol:(NSString *)symbol;
- (instancetype)deleteSymbols:(NSArray *)symbols;
- (NSArray *)symbols;

@end
