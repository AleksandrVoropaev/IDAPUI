//
//  AVArrayChangesObject.h
//  iOSProject
//
//  Created by Aleksandr Voropaev on 9/26/16.
//  Copyright © 2016 Aleksandr Voropaev. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "AVArrayModel.h"

@interface AVArrayOneIndexChangesObject : NSObject
@property (nonatomic, readonly)   id            object;
@property (nonatomic, readonly)   NSUInteger    *index;
@property (nonatomic, readonly)   AVArrayState  arraySate;

+ (instancetype)arrayChangedWithObject:(id)object
                                 index:(NSUInteger)index
                             arraySate:(AVArrayState)arraySate;

@end
