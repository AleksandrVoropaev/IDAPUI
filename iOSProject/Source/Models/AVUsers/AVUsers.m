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

//+ (instancetype)usersWithCount:(NSUInteger)count {
//    return [[self alloc] initWithCount:count];
//}

#pragma mark -
#pragma mark Initializations and Deallocations

- (instancetype)init {
    return [self initWithCount:kAVRandomUsersCount];
}

- (instancetype)initWithCount:(NSUInteger)count {
    self = [super init];
    
    [self performBlockWitouthNotifications:^{
        [self addRandomUsersWithCount:count];
    }];
    
    return self;
}

#pragma mark -
#pragma mark Public

- (void)addRandomUsersWithCount:(NSUInteger)count {
    [self addObjects:[AVUser objectsWithCount:count]];
//    id result = [NSMutableArray arrayWithCount:count factoryBlock:^id{
//        return [AVUser new];
//    }];
//    
//    [self addObjects:result];

//    for (NSUInteger iterator = 0; iterator < count; iterator++) {
//        [self addObject:[AVUser new]];
//    }
}

- (void)addUsers:(NSArray *)users {
    for (AVUser *user in users) {
        [self addObject:user];
    }
}

@end
