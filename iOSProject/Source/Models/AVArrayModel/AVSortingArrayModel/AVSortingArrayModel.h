//
//  AVSortingArrayModel.h
//  iOSProject
//
//  Created by Aleksandr Voropaev on 9/15/16.
//  Copyright © 2016 Aleksandr Voropaev. All rights reserved.
//

#import "AVArrayModel.h"

typedef enum : NSUInteger {
    AVArraySortTypeAscending,
    AVArraySortTypeDescending,
    AVArraySortTypeNotSorted,
    AVArraySortTypeCount,
} AVArraySortType;

@interface AVSortingArrayModel : AVArrayModel
@property (nonatomic, assign)   AVArraySortType     sortType;

+ (instancetype)sortingArrayModel:(id)objects;

@end
