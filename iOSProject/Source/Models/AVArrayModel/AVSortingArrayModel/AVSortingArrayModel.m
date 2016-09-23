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


#pragma mark -
#pragma mark Public


#pragma mark -
#pragma mark Private

- (void)resortArray {
    AVArraySortType sortType = (self.sortType + 1) % AVArraySortTypeCount;
    self.sortType = sortType;
    [self sortArrayWithType:sortType];
}

- (void)sortArrayWithType:(AVArraySortType)sortType {
    NSMutableArray *array = [NSMutableArray arrayWithArray:self.objects];
    [array sortUsingComparator:^NSComparisonResult(AVUser *firstUser, AVUser *secondUser) {
        NSString *firstSurname = firstUser.surname;
        NSString *secondSurname = secondUser.surname;
        
        return [self compareFirstSurname:firstSurname secondSurname:secondSurname sortType:sortType];
    }];
    
    [self replaceAllObjectsWithObjects:array];
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
            AVSwitchCaseDefault({ return nil; });
    }
}



@end
