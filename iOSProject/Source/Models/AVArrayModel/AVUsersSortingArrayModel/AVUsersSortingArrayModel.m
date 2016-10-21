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
#import "AVGCD.h"

#import "AVArrayChangesObject+AVArrayModel.h"
#import "AVSwitchCaseMacro.h"

static NSString * const kSortingKey = @"surname";

@implementation AVUsersSortingArrayModel

#pragma mark -
#pragma mark Overwrite SuperClass methods

- (NSArray<NSSortDescriptor *> *)sortDescriptorsWithSortType:(AVArraySortType)sortType {
    BOOL ascending = sortType == AVArraySortTypeAscending;
    NSSortDescriptor *sortDescriptor = [NSSortDescriptor sortDescriptorWithKey:kSortingKey ascending:ascending];
    return @[sortDescriptor];
}

#pragma mark -
#pragma mark Observation

- (void)arrayModel:(AVUsers *)model didChangeWithChangesObject:(AVArrayChangesObject *)changes {
    if (self.model == model) {
        [changes applyToModel:self];
    }
}

//- (void)modelDidLoad:(AVModel *)model {
//    if (self.model == model) {
//        
//    }
//}

@end
