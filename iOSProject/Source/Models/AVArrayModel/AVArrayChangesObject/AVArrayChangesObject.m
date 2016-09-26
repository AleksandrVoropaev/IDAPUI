//
//  AVArrayChangesObject.m
//  iOSProject
//
//  Created by Aleksandr Voropaev on 9/26/16.
//  Copyright © 2016 Aleksandr Voropaev. All rights reserved.
//

#import "AVArrayChangesObject.h"

@implementation AVArrayChangesObject

+ (instancetype)arrayChangedWithObject:(id)object
                             baseIndex:(NSIndexPath *)baseIndex
                      destinationIndex:(NSIndexPath *)destinationIndex
                             arraySate:(AVArrayState)arraySate
{
    return [[self alloc] initWithObject:object
                              baseIndex:baseIndex
                       destinationIndex:destinationIndex
                              arraySate:arraySate];
}

- (instancetype)initWithObject:(id)object
                     baseIndex:(NSIndexPath *)baseIndex
              destinationIndex:(NSIndexPath *)destinationIndex
                     arraySate:(AVArrayState)arraySate
{
    if (!object | !baseIndex | !arraySate) {
        return nil;
    }
    
    self = [super init];
    self.object = object;
    self.baseIndex = baseIndex;
    self.destinationIndex = destinationIndex;
    self.arraySate = arraySate;
    
    return self;
}

@end
