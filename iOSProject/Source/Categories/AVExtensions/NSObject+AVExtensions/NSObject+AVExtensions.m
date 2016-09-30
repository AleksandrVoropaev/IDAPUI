//
//  NSObject+AVExtentions.m
//  ObjectiveC
//
//  Created by Aleksandr Voropaev on 6/21/16.
//  Copyright © 2016 Aleksandr Voropaev. All rights reserved.
//

#import "NSObject+AVExtensions.h"

#import "NSArray+AVExtensions.h"

@implementation NSObject (AVExtentions)

+ (instancetype)object {
    return [[self alloc] init];
}

+ (NSArray *)objectsWithCount:(NSUInteger)count {
//    NSMutableArray *result = [NSMutableArray array];
//    for (NSUInteger index = 0; index < count; index++) {
//        [result addObject:[self object]];
//    }
//    
//    return [result copy];
    return [NSArray arrayWithCount:count factoryBlock:^id{
        return [self object];
    }];
}

@end
