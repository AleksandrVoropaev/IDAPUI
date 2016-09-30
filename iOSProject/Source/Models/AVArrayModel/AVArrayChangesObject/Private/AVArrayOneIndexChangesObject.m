//
//  AVArrayChangesObject.m
//  iOSProject
//
//  Created by Aleksandr Voropaev on 9/26/16.
//  Copyright © 2016 Aleksandr Voropaev. All rights reserved.
//

#import "AVArrayOneIndexChangesObject.h"

#import "AVSwitchCaseMacro.h"

@interface AVArrayOneIndexChangesObject ()
@property (nonatomic, strong)   id              object;
@property (nonatomic, assign)   NSUInteger      index;

@end
@implementation AVArrayOneIndexChangesObject

+ (instancetype)arrayChangedWithObject:(id)object
                                 index:(NSUInteger)index
                           changesType:(AVArrayModelChange)changesType
{
    return [[self alloc] initWithObject:object
                                  index:index
                            changesType:changesType];
}

- (instancetype)initWithObject:(id)object
                         index:(NSUInteger)index
                   changesType:(AVArrayModelChange)changesType
{
    if (!object | !index | !changesType) {
        return nil;
    }
    
    self = [super initWithChangesType:changesType];
    self.object = object;
    self.index = index;
    
    return self;
}

@end
