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

#import "AVArrayChangesObject+AVArrayModel.h"
#import "AVSwitchCaseMacro.h"

@implementation AVUsersSortingArrayModel

#pragma mark -
#pragma mark Overwrite SuperClass methods

- (NSArray<NSSortDescriptor *> *)sortDescriptorsWithSortType:(AVArraySortType)sortType {
    BOOL ascending = sortType == AVArraySortTypeAscending ? YES : NO;
    NSSortDescriptor *sortDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"surname" ascending:ascending];
    return @[sortDescriptor];
}

#pragma mark -
#pragma mark Observation

- (void)arrayModel:(AVUsers *)model didChangeWithChangesObject:(AVArrayChangesObject *)changes {
    if (self.model == model) {
        [changes applyToModel:self];
    }
}

@end
