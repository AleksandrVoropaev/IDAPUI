//
//  NSArray+AVExtensions.m
//  ObjectiveC
//
//  Created by Aleksandr Voropaev on 7/7/16.
//  Copyright © 2016 Aleksandr Voropaev. All rights reserved.
//

#import "NSArray+AVExtensions.h"

@implementation NSArray (AVExtensions)

+ (instancetype)arrayWithCount:(NSUInteger)count factoryBlock:(id (^)(void))objectsParametersBlock {
    if (!objectsParametersBlock) {
        return nil;
    }
    
    NSMutableArray *result = [NSMutableArray arrayWithCapacity:count];
    
    for (NSUInteger index = 0; index < count; index++) {
        [result addObject:objectsParametersBlock()];
    }
    
    return [self arrayWithArray:result];
}

- (NSArray *)filteredArrayUsingBlock:(AVArrayFilterBlock)block {
    if (!block) {
        return self;
    }

    NSPredicate *predicate = [NSPredicate predicateWithBlock:^BOOL(id evaluatedObject, NSDictionary *bindings) {
        return block(evaluatedObject);
    }];

    return [self filteredArrayUsingPredicate:predicate];
}

- (void)performEachObjectUsingBlock:(void (^)(id object))operationBlock {
    for (id object in self) {
        operationBlock(object);
    }
}

- (NSArray *)objectsWithClass:(Class)cls {
    return [self filteredArrayUsingBlock:^BOOL(id object) {
        return [object class] == cls;
    }];
}

- (id)firstObjectWithClass:(Class)cls {
    return [[self objectsWithClass:cls] firstObject];
}

@end
