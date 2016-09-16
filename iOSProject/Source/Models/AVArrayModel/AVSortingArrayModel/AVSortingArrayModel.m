//
//  AVSortingArrayModel.m
//  iOSProject
//
//  Created by Aleksandr Voropaev on 9/15/16.
//  Copyright © 2016 Aleksandr Voropaev. All rights reserved.
//

#import "AVSortingArrayModel.h"

#import "AVUser.h"
#import "AVArrayModel.h"

#import "AVSwitchCaseMacro.h"

typedef NSComparisonResult(^AVComparisonBlock)(NSString *firstSurname, NSString *secondSurname);

@interface AVSortingArrayModel ()
@property (nonatomic, strong)   NSMutableArray  *array;
@property (nonatomic, assign)   BOOL            isAscending;

@end

@implementation AVSortingArrayModel

+ (id)sortedArray:(AVUsers *)users {
    return [[self alloc] initWithUsers:users];
}

- (instancetype)init {
    self = [super init];
    self.array = [NSMutableArray array];
    self.isAscending = YES;
    
    return self;
}

- (instancetype)initWithUsers:(AVUsers *)users {
    self = [self init];
    self.users = users;
    [self.array addObjectsFromArray:[users users]];
    
    return self;
}

- (void)setUsers:(AVUsers *)users {
    if (_users != users) {
        _users = users;
        self.array = [NSMutableArray arrayWithArray:[users users]];
    }
}

- (void)setArray:(NSMutableArray *)array {
    if (_array != array) {
        _array = array;
    }
}

- (void)sortArrayWithType:(AVArraySortType)sortType {
    [self.array sortUsingComparator:^NSComparisonResult(AVUser *firstUser, AVUser *secondUser) {
        NSString *firstSurname = firstUser.surname;
        NSString *secondSurname = secondUser.surname;
        AVComparisonBlock comparisonBlock = [self blockForSortType:sortType];
        return comparisonBlock(firstSurname, secondSurname);
    }];
}

- (AVComparisonBlock)blockForSortType:(AVArraySortType)sortType {
    switch (sortType) {
        AVSwitchCase(AVArraySortTypeAscending, { return ^NSComparisonResult(NSString *firstSurname, NSString *secondSurname){
            return [secondSurname compare:firstSurname];
        };});
        AVSwitchCase(AVArraySortTypeDescending, { return ^NSComparisonResult(NSString *firstSurname, NSString *secondSurname){
            return [firstSurname compare:secondSurname];
        };});
        AVSwitchCaseDefault({});
    }
    
    return nil;
}

- (AVArraySortType)sortType {
    AVArraySortType sortType = AVArraySortTypeAscending;
    if (self.isAscending) {
        sortType = AVArraySortTypeAscending;
    } else {
        sortType = AVArraySortTypeDescending;
    }
    
    self.isAscending = !self.isAscending;
    return sortType;
}


@end
