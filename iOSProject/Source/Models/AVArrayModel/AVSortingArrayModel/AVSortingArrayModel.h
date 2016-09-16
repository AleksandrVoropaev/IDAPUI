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
} AVArraySortType;

@interface AVSortingArrayModel : AVUsers
@property (nonatomic, strong)   AVUsers     *users;

//+ (id)sortedArray:(AVUsers *)users withType:(AVArraySortType)sortType;
+ (id)sortedArray:(AVUsers *)users;

- (void)sortArrayWithType:(AVArraySortType)sortType;

@end
