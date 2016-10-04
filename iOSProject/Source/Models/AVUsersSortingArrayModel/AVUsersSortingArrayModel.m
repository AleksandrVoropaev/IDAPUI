//
//  AVSortingArrayModel.m
//  iOSProject
//
//  Created by Aleksandr Voropaev on 9/15/16.
//  Copyright © 2016 Aleksandr Voropaev. All rights reserved.
//

#import "AVUsersSortingArrayModel.h"

#import "AVUser.h"
#import "AVUsers.h"

#import "AVArrayChangesObject+UITableView.h"
#import "AVArrayChangesObject+AVArrayModel.h"
#import "AVSwitchCaseMacro.h"

typedef NSComparisonResult(^AVComparisonBlock)(NSString *firstSurname, NSString *secondSurname);

@interface AVUsersSortingArrayModel ()
@property (nonatomic, strong)   AVUsers             *users;

@end

@implementation AVUsersSortingArrayModel

#pragma mark -
#pragma mark Class Methods

+ (instancetype)sortingArrayModelWithModel:(AVUsers *)users {
    return [[self alloc] initWithUsers:users];
}

#pragma mark -
#pragma mark Initializations and Deallocations

- (void)dealloc {
    self.users = nil;
}
- (instancetype)init {
    return [self initWithUsers:nil];
}

- (instancetype)initWithUsers:(AVUsers *)users {
    if (!users) {
        return nil;
    }
    
    self = [super init];
    self.users = users;

    return self;
}

#pragma mark -
#pragma mark Accessors

- (void)setUsers:(AVUsers *)users {
    @synchronized (self) {
        if (users != _users) {
            [_users removeObserver:self];
            _users = users;
            [_users addObserver:self];
            if (_users) {
                [self addObjects:users.objects];
                [self sort];
            }
        }
    }
}

#pragma mark -
#pragma mark Public

- (void)sortWithType:(AVArraySortType)sortType {
    @synchronized (self) {
        id result = self.users.objects;
        if (sortType != AVArraySortTypeNotSorted) {
            result = [self.objects sortedArrayUsingComparator:^NSComparisonResult(AVUser *firstUser, AVUser *secondUser) {
                return [self compareFirstSurname:firstUser.surname
                                   secondSurname:secondUser.surname
                                        sortType:sortType];
            }];
        }
        
        [self replaceAllObjectsWithObjects:result];
    }
}

#pragma mark -
#pragma mark Private

- (void)sort {
    [self sortWithType:self.sortType];
}

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
        AVSwitchCase(AVArraySortTypeNotSorted, { return NSOrderedSame; };);
        AVSwitchCaseDefault({ return NSOrderedSame; });
    }
}

#pragma mark -
#pragma mark Observation

- (void)arrayModel:(AVUsers *)model didChangeWithChangesObject:(AVArrayChangesObject *)changes {
//    if (self.users == model) {
//        [self performBlockWithoutNotifications:^{
//            [changes applyToModel:self.users];
//        }];
//    }
}

@end
