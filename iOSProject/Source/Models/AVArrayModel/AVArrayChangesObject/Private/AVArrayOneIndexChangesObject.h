//
//  AVArrayChangesObject.h
//  iOSProject
//
//  Created by Aleksandr Voropaev on 9/26/16.
//  Copyright © 2016 Aleksandr Voropaev. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "AVArrayChangesObject.h"

#import "AVArrayModel.h"

@interface AVArrayOneIndexChangesObject : AVArrayChangesObject
@property (nonatomic, readonly)   id            object;
@property (nonatomic, readonly)   NSUInteger    index;

+ (instancetype)arrayChangedWithObject:(id)object
                                 index:(NSUInteger)index
                           changesType:(AVArrayModelChange)changesType;

- (instancetype)initWithObject:(id)object
                         index:(NSUInteger)index
                   changesType:(AVArrayModelChange)changesType;

@end
