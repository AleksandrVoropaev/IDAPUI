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

+ (id)arrayChangedWithObject:(id)object
                       index:(NSUInteger)index
                 changesType:(AVArrayModelChange)changesType
{
    return [AVArrayOneIndexChangesObject arrayChangedWithObject:object
                                                          index:index
                                                    changesType:changesType];
}

+ (id)arrayChangedWithObject:(id)object
                       index:(NSUInteger)index
                 targetIndex:(NSUInteger)targetIndex
                 changesType:(AVArrayModelChange)changesType
{
    return [AVArrayTwoIndexesChangesObject arrayChangedWithObject:object
                                                            index:index
                                                      targetIndex:targetIndex
                                                      changesType:changesType];
}

- (instancetype)initWithChangesType:(AVArrayModelChange)changesType {
    self = [super init];
    self.changesType = changesType;
    
    return self;
}

@end
