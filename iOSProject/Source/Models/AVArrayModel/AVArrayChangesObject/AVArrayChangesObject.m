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

@implementation AVArrayChangesObject

+ (id)arrayChangedWithObject:(id)object
                       index:(NSUInteger)index
                   arraySate:(AVArrayState)arraySate
{
    return [AVArrayOneIndexChangesObject arrayChangedWithObject:object
                                                          index:index
                                                      arraySate:arraySate];
}

+ (id)arrayChangedWithObject:(id)object
                       index:(NSUInteger)index
                 targetIndex:(NSUInteger)targetIndex
                   arraySate:(AVArrayState)arraySate
{
    return [AVArrayTwoIndexesChangesObject arrayChangedWithObject:object
                                                            index:index
                                                      targetIndex:targetIndex
                                                        arraySate:arraySate];
}

@end
