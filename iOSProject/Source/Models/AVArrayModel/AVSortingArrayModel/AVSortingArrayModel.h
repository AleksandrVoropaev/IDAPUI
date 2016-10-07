//
//  AVSortingArrayModel.h
//  iOSProject
//
//  Created by Aleksandr Voropaev on 9/15/16.
//  Copyright © 2016 Aleksandr Voropaev. All rights reserved.
//

#import "AVArrayModel.h"

typedef enum : NSUInteger {
    AVArraySortTypeNotSorted,
    AVArraySortTypeAscending,
    AVArraySortTypeDescending,
    AVArraySortTypeCount,
} AVArraySortType;

@interface AVSortingArrayModel : AVArrayModel
@property (nonatomic, readonly) AVArrayModel    *model;
@property (nonatomic, assign)   AVArraySortType sortType;

+ (instancetype)sortingArrayModelWithModel:(id)objects;

// need to overrite in subclasses
- (NSArray<NSSortDescriptor *> *)sortDescriptorsWithSortType:(AVArraySortType)sortType;

@end
