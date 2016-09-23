//
//  NSMutableArray+AVExtensions.m
//  iOSProject
//
//  Created by Aleksandr Voropaev on 9/23/16.
//  Copyright © 2016 Aleksandr Voropaev. All rights reserved.
//

#import "NSMutableArray+AVExtensions.h"

@implementation NSMutableArray (AVExtensions)

- (void)moveObjectFromIndex:(NSUInteger)baseIndex toIndex:(NSUInteger)targetIndex {
    [self insertObject:[self objectAtIndex:baseIndex] atIndex:targetIndex + 1];
    [self removeObjectAtIndex:baseIndex];
}

@end
