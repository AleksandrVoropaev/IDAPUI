//
//  AVSortingArrayModel.h
//  iOSProject
//
//  Created by Aleksandr Voropaev on 9/15/16.
//  Copyright © 2016 Aleksandr Voropaev. All rights reserved.
//

#import "AVSortingArrayModel.h"

@class AVUsers;

@interface AVUsersSortingArrayModel : AVSortingArrayModel <AVArrayModelObserver>
@property (nonatomic, readonly) AVUsers *users;

+ (instancetype)sortingArrayModel:(AVUsers *)users;

- (void)sortWithType:(AVArraySortType)sortType;

@end
