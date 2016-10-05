//
//  AVArrayTwoIndexesChangesObject.m
//  iOSProject
//
//  Created by Aleksandr Voropaev on 9/27/16.
//  Copyright © 2016 Aleksandr Voropaev. All rights reserved.
//

#import "AVArrayTwoIndexesChangesObject.h"

@interface AVArrayTwoIndexesChangesObject ()
@property (nonatomic, strong)   id          targetObject;
@property (nonatomic, assign)   NSUInteger  targetIndex;

@end

@implementation AVArrayTwoIndexesChangesObject

+ (instancetype)arrayChangeWithObject:(id)object
                                index:(NSUInteger)index
                         targetObject:(id)secondObject
                          targetIndex:(NSUInteger)targetIndex
                          changesType:(AVArrayModelChange)changesType
{
    return [[self alloc] initWithObject:object
                                  index:index
                           targetObject:secondObject
                            targetIndex:targetIndex
                            changesType:changesType];
}

- (instancetype)initWithObject:(id)object
                         index:(NSUInteger)index
                  targetObject:(id)secondObject
                   targetIndex:(NSUInteger)targetIndex
                   changesType:(AVArrayModelChange)changesType
{
    self = [super initWithObject:object index:index changesType:changesType];
    self.targetObject = secondObject;
    self.targetIndex = targetIndex;
    
    return self;
}

@end
