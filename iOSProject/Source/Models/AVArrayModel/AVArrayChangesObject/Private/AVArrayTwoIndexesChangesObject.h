//
//  AVArrayTwoIndexesChangesObject.h
//  iOSProject
//
//  Created by Aleksandr Voropaev on 9/27/16.
//  Copyright © 2016 Aleksandr Voropaev. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "AVArrayOneIndexChangesObject.h"

@interface AVArrayTwoIndexesChangesObject : AVArrayOneIndexChangesObject
@property (nonatomic, readonly) id          secondObject;
@property (nonatomic, readonly) NSUInteger  targetIndex;

+ (instancetype)arrayChangeWithObject:(id)object
                                index:(NSUInteger)index
                         secondObject:(id)secondObject
                          targetIndex:(NSUInteger)targetIndex
                          changesType:(AVArrayModelChange)changesType;

@end
