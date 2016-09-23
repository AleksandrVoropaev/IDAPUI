//
//  AVSortingArrayModel.h
//  iOSProject
//
//  Created by Aleksandr Voropaev on 9/15/16.
//  Copyright © 2016 Aleksandr Voropaev. All rights reserved.
//

#import "AVUsers.h"

typedef enum : NSUInteger {
    AVArraySortTypeAscending,
    AVArraySortTypeDescending,
    AVArraySortTypeCount,
} AVArraySortType;

@interface AVSortingArrayModel : AVArrayModel
@property (nonatomic, strong)       AVUsers             *users;
@property (nonatomic, readonly)     AVArraySortType     sortType;

+ (instancetype)sortArray:(AVUsers *)users;

- (void)sort;
- (void)sortWithType:(AVArraySortType)sortType;
- (void)resort;

@end
