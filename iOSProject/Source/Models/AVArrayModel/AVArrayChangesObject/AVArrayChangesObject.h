//
//  AVArrayChangesObject.h
//  iOSProject
//
//  Created by Aleksandr Voropaev on 9/26/16.
//  Copyright © 2016 Aleksandr Voropaev. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "AVArrayModel.h"

@interface AVArrayChangesObject : NSObject
@property (nonatomic, strong)   id              object;
@property (nonatomic, assign)   NSIndexPath     *baseIndex;
@property (nonatomic, assign)   NSIndexPath     *destinationIndex;
@property (nonatomic, assign)   AVArrayState    arraySate;

+ (instancetype)arrayChangedWithObject:(id)object
                             baseIndex:(NSIndexPath *)baseIndex
                      destinationIndex:(NSIndexPath *)destinationIndex
                             arraySate:(AVArrayState)arraySate;

@end
