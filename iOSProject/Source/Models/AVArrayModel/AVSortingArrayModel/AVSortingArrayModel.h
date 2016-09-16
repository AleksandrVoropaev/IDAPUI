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
@property (nonatomic, assign)       AVArraySortType     sortType;

+ (instancetype)sortArray:(AVUsers *)users;

- (AVUsers *)sortedUsers;
- (AVUsers *)resortedUsers;

@end
