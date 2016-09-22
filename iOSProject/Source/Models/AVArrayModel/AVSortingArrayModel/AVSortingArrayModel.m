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
@property (nonatomic, assign)   AVArraySortType     sortType;
//@property (nonatomic, strong)   NSMutableArray  *sortedArray;

@end

@implementation AVSortingArrayModel

#pragma mark -
#pragma mark Class Methods

+ (instancetype)sortArray:(NSArray *)users {
    return [[self alloc] initWithUsers:users];
}

#pragma mark -
#pragma mark Initializations and Deallocations

- (instancetype)init {
    self = [super init];
//    self.sortedArray = [NSMutableArray array];
    self.sortType = AVArraySortTypeAscending;
    
    return self;
}

- (instancetype)initWithUsers:(NSArray *)users {
    self = [self init];
//    self.users = users;
    [self addObjects:users];
    [self sortArrayWithType:self.sortType];
    
    return self;
}

#pragma mark -
#pragma mark Accessors

//- (void)setUsers:(AVUsers *)users {
//    if (_users != users) {
//        _users = users;
//        self.sortedArray = [NSMutableArray arrayWithArray:[users users]];
//    }
//}

//- (void)setSortedArray:(NSMutableArray *)sortedArray {
//    if (_sortedArray != sortedArray) {
//        _sortedArray = sortedArray;
//        [self resortArray];
//    }
//}

#pragma mark -
#pragma mark Public

//- (AVUsers *)sortedUsers {
//    return [AVUsers usersWithUsers:self.sortedArray];
//}

//- (AVUsers *)resortedUsers {
//    [self resortArray];
//    return [self sortedUsers];
//}

#pragma mark -
#pragma mark Private

- (void)resortArray {
    AVArraySortType sortType = (self.sortType + 1) % AVArraySortTypeCount;
    self.sortType = sortType;
    [self sortArrayWithType:sortType];
}

//- (AVArraySortType)sortType {
//    AVArraySortType sortType = _sortType;
//    _sortType = (_sortType + 1) % AVArraySortTypeCount;
//    
//    return sortType;
//}

- (void)sortArrayWithType:(AVArraySortType)sortType {
    NSMutableArray *array = [NSMutableArray arrayWithArray:self.objects];
    [array sortUsingComparator:^NSComparisonResult(AVUser *firstUser, AVUser *secondUser) {
        NSString *firstSurname = firstUser.surname;
        NSString *secondSurname = secondUser.surname;
        AVComparisonBlock comparisonBlock = [self blockForSortType:sortType];
        
        return comparisonBlock(firstSurname, secondSurname);
    }];
    
    [self replaceAllObjectsWithObjects:array];
}

- (AVComparisonBlock)blockForSortType:(AVArraySortType)sortType {
    switch (sortType) {
        AVSwitchCase(AVArraySortTypeAscending, { return ^NSComparisonResult(NSString *firstSurname, NSString *secondSurname){
            return [secondSurname compare:firstSurname];
        };});
        AVSwitchCase(AVArraySortTypeDescending, { return ^NSComparisonResult(NSString *firstSurname, NSString *secondSurname){
            return [firstSurname compare:secondSurname];
        };});
        AVSwitchCaseDefault({ return nil; });
    }
}

@end
