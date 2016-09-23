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

@end

@implementation AVSortingArrayModel

#pragma mark -
#pragma mark Class Methods

+ (instancetype)sortArray:(AVUsers *)users {
    return [[self alloc] initWithUsers:users];
}

#pragma mark -
#pragma mark Initializations and Deallocations

- (instancetype)init {
    self = [super init];
    self.sortType = AVArraySortTypeAscending;
    
    return self;
}

- (instancetype)initWithUsers:(AVUsers *)users {
    self = [self init];
    self.users = users;
    
    return self;
}

#pragma mark -
#pragma mark Accessors

- (void)setUsers:(AVUsers *)users {
    @synchronized (self) {
        if (users != _users) {
            _users = users;
            if (_users) {
                [self addObjects:users.objects];
                [self sort];
            }
        }
    }
}

- (void)setSortType:(AVArraySortType)sortType {
    @synchronized (self) {
        if (_sortType != sortType) {
            _sortType = sortType;
            if (_sortType && self.objects) {
                [self sort];
            }
        }
    }
}

#pragma mark -
#pragma mark Public

- (void)sort {
    @synchronized (self) {
        [self sortWithType:self.sortType];
    }
}

- (void)resort {
    @synchronized (self) {
        AVArraySortType sortType = (self.sortType + 1) % AVArraySortTypeCount;
        self.sortType = sortType;
        [self sortWithType:sortType];
    }
}

- (void)sortWithType:(AVArraySortType)sortType {
    @synchronized (self) {
        NSMutableArray *array = [NSMutableArray arrayWithArray:self.objects];
        [array sortUsingComparator:^NSComparisonResult(AVUser *firstUser, AVUser *secondUser) {
            NSString *firstSurname = firstUser.surname;
            NSString *secondSurname = secondUser.surname;
            
            return [self compareFirstSurname:firstSurname secondSurname:secondSurname sortType:sortType];
        }];
        
        [self replaceAllObjectsWithObjects:array];
    }
}

#pragma mark -
#pragma mark Private

- (NSComparisonResult)compareFirstSurname:(NSString *)firstSurname
                            secondSurname:(NSString *)secondSurname
                                 sortType:(AVArraySortType)sortType
{
    AVComparisonBlock comparisonBlock = ^NSComparisonResult(NSString *firstBlockSurname, NSString *secondBlockSurname) {
        return [firstBlockSurname compare:secondBlockSurname];
    };
    
    switch (self.sortType) {
        AVSwitchCase(AVArraySortTypeAscending, { return comparisonBlock(secondSurname, firstSurname); };);
        AVSwitchCase(AVArraySortTypeDescending, { return comparisonBlock(firstSurname, secondSurname); };);
        AVSwitchCaseDefault({ return nil; });
    }
}



@end
