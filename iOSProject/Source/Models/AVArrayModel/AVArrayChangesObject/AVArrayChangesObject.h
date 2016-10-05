//
//  AVArrayChangesObject.h
//  iOSProject
//
//  Created by Aleksandr Voropaev on 9/27/16.
//  Copyright © 2016 Aleksandr Voropaev. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, AVArrayModelChange) {
    AVArrayModelChangeDidDeleteObject,
    AVArrayModelChangeDidInsertObject,
    AVArrayModelChangeDidMoveObject
};

@interface AVArrayChangesObject : NSObject
@property (nonatomic, readonly) AVArrayModelChange  changesType;

+ (id)arrayChangeWithObject:(id)object
                      index:(NSUInteger)index
                changesType:(AVArrayModelChange)changesType;

+ (id)arrayChangeWithObject:(id)object
                      index:(NSUInteger)index
               targetObject:(id)secondObject
                targetIndex:(NSUInteger)targetIndex
                changesType:(AVArrayModelChange)changesType;

- (instancetype)initWithChangesType:(AVArrayModelChange)changesType;

@end
