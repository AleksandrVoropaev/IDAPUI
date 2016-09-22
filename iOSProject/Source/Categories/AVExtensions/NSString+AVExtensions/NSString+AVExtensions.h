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

- (NSArray *)symbols;

@end
