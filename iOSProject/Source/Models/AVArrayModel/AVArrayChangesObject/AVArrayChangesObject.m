//
//  AVArrayChangesObject.m
//  iOSProject
//
//  Created by Aleksandr Voropaev on 9/27/16.
//  Copyright © 2016 Aleksandr Voropaev. All rights reserved.
//

#import "AVArrayChangesObject.h"

#import "AVArrayOneIndexChangesObject.h"
#import "AVArrayTwoIndexesChangesObject.h"

@interface AVArrayChangesObject ()
@property (nonatomic, assign)   AVArrayModelChange  changesType;

@end

@implementation AVArrayChangesObject

+ (id)arrayChangeWithObject:(id)object
                       index:(NSUInteger)index
                 changesType:(AVArrayModelChange)changesType
{
    return [AVArrayOneIndexChangesObject arrayChangeWithObject:object
                                                         index:index
                                                   changesType:changesType];
}

+ (id)arrayChangeWithObject:(id)object
                       index:(NSUInteger)index
                secondObject:(id)secondObject
                 targetIndex:(NSUInteger)targetIndex
                 changesType:(AVArrayModelChange)changesType
{
    return [AVArrayTwoIndexesChangesObject arrayChangeWithObject:object
                                                           index:index
                                                    secondObject:(id)secondObject
                                                     targetIndex:targetIndex
                                                     changesType:changesType];
}

- (instancetype)initWithChangesType:(AVArrayModelChange)changesType {
    self = [super init];
    self.changesType = changesType;
    
    return self;
}

@end
