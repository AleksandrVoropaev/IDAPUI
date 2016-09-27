//
//  AVArrayTwoIndexesChangesObject.m
//  iOSProject
//
//  Created by Aleksandr Voropaev on 9/27/16.
//  Copyright © 2016 Aleksandr Voropaev. All rights reserved.
//

#import "AVArrayTwoIndexesChangesObject.h"

@interface AVArrayTwoIndexesChangesObject ()
@property (nonatomic, assign)   NSUInteger      *destinationIndex;
@property (nonatomic, strong)   id              object;
@property (nonatomic, assign)   NSUInteger      *index;
@property (nonatomic, assign)   AVArrayState    arraySate;

@end

@implementation AVArrayTwoIndexesChangesObject

+ (instancetype)arrayChangedWithObject:(id)object
                                index:(NSUInteger)index
                          targetIndex:(NSUInteger)targetIndex
                            arraySate:(AVArrayState)arraySate
{
    
}

- (instancetype)initWithObject:(id)object
                                index:(NSUInteger)index
                          targetIndex:(NSUInteger)targetIndex
                            arraySate:(AVArrayState)arraySate
{
    self = [super init];
    self.index = index;
    
    
    return self;
}

@end
