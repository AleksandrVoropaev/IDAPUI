//
//  AVArrayChangesObject.m
//  iOSProject
//
//  Created by Aleksandr Voropaev on 9/26/16.
//  Copyright © 2016 Aleksandr Voropaev. All rights reserved.
//

#import "AVArrayOneIndexChangesObject.h"

@interface AVArrayOneIndexChangesObject ()
@property (nonatomic, strong)   id              object;
@property (nonatomic, assign)   NSUInteger      *index;
@property (nonatomic, assign)   AVArrayState    arraySate;

@end
@implementation AVArrayOneIndexChangesObject

+ (instancetype)arrayChangedWithObject:(id)object
                                 index:(NSUInteger)index
                             arraySate:(AVArrayState)arraySate
{
    return [[self alloc] initWithObject:object
                                  index:index
                              arraySate:arraySate];
}

- (instancetype)initWithObject:(id)object
                         index:(NSUInteger)index
                     arraySate:(AVArrayState)arraySate
{
    if (!object | !index | !arraySate) {
        return nil;
    }
    
    self = [super init];
    self.object = object;
    self.index = index;
    self.arraySate = arraySate;
    
    return self;
}

@end
