//
//  AVUsers.m
//  iOSProject
//
//  Created by Aleksandr Voropaev on 9/12/16.
//  Copyright © 2016 Aleksandr Voropaev. All rights reserved.
//

#import "AVUsers.h"

#import "AVUser.h"

#import "NSArray+AVExtensions.h"
#import "NSObject+AVExtensions.h"

static const NSUInteger kAVRandomUsersCount = 5;

@implementation AVUsers

#pragma mark -
#pragma mark Class Methods

+ (instancetype)users {
    return [self new];
}

#pragma mark -
#pragma mark Initializations and Deallocations

- (void)dealloc {
    [self save];
}

- (instancetype)init {
    self = [super init];
    NSArray *objects = [NSKeyedUnarchiver unarchiveObjectWithFile:@"/Users/Aleksandr/IDAPUI/iOSProject/Source/Models/data.plist"];
    if (objects && objects.count) {
        [self addObjects:objects];
    } else {
        [self performBlockWithoutNotifications:^{
            [self addRandomUsersWithCount:kAVRandomUsersCount];
        }];
    }
    
    return self;
}

#pragma mark -
#pragma mark Public

- (void)addRandomUsersWithCount:(NSUInteger)count {
    [self addObjects:[AVUser objectsWithCount:count]];
}

- (void)addUsers:(NSArray *)users {
    for (AVUser *user in users) {
        [self addObject:user];
    }
}

- (void)save {
    [NSKeyedArchiver archiveRootObject:self.objects toFile:@"/Users/Aleksandr/IDAPUI/iOSProject/Source/Models/data.plist"];
}

@end
