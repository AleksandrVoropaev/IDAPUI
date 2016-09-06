//
//  NSString+AVRandomName.m
//  iOSProject
//
//  Created by Aleksandr Voropaev on 9/6/16.
//  Copyright © 2016 Aleksandr Voropaev. All rights reserved.
//

#import "NSString+AVRandomName.h"

#import "NSString+AVExtensions.h"

static const NSUInteger kAVRandomNameLength = 9;

@implementation NSString (AVRandomName)

+ (instancetype)randomName {
    return [[self randomStringWithLength:kAVRandomNameLength alphabet:[AVAlphabet lowercaseAlphabet]] capitalizedString];
}

@end
