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
@property (nonatomic, strong)   AVUsers             *users;

@end

@implementation AVSortingArrayModel

#pragma mark -
#pragma mark Class Methods

+ (instancetype)sortingArrayModel:(AVUsers *)users {
    return [[self alloc] initWithUsers:users];
}

#pragma mark -
#pragma mark Initializations and Deallocations

- (instancetype)init {
    return [self initWithUsers:nil];
}

- (instancetype)initWithUsers:(AVUsers *)users {
    if (!users) {
        return nil;
    }
    
    self = [super init];
    self.users = users;
    self.sortType = AVArraySortTypeAscending;

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
            if (self.objects) {
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

//- (void)resort {
//    @synchronized (self) {
//        AVArraySortType sortType = (self.sortType + 1) % AVArraySortTypeCount;
//        self.sortType = sortType;
//        [self sortWithType:sortType];
//    }
//}

- (void)sortWithType:(AVArraySortType)sortType {
    @synchronized (self) {
        id result = [self.objects sortedArrayUsingComparator:^NSComparisonResult(AVUser *firstUser, AVUser *secondUser) {
            return [self compareFirstSurname:firstUser.surname
                               secondSurname:secondUser.surname
                                    sortType:sortType];
        }];
        
        [self replaceAllObjectsWithObjects:result];
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
