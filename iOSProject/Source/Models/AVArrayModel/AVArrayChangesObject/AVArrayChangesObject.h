//
//  AVArrayChangesObject.h
//  iOSProject
//
//  Created by Aleksandr Voropaev on 9/27/16.
//  Copyright © 2016 Aleksandr Voropaev. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "AVArrayModel.h"

@interface AVArrayChangesObject : NSObject

+ (id)arrayChangedWithObject:(id)object
                       index:(NSUInteger)index
                   arraySate:(AVArrayState)arraySate;

+ (id)arrayChangedWithObject:(id)object
                       index:(NSUInteger)index
                 targetIndex:(NSUInteger)targetIndex
                   arraySate:(AVArrayState)arraySate;

@end
