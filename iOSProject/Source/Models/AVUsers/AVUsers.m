//
//  AVUsers.m
//  iOSProject
//
//  Created by Aleksandr Voropaev on 9/12/16.
//  Copyright © 2016 Aleksandr Voropaev. All rights reserved.
//

#import "AVUsers.h"

#import "AVUser.h"

static const NSUInteger kAVRandomUsersCount = 5;

@implementation AVUsers

#pragma mark -
#pragma mark Class Methods

+ (instancetype)users {
    return [self new];
}

//+ (instancetype)usersWithUsers:(NSArray *)users {
//    return [[self alloc] initWithUsers:users];
//}

+ (instancetype)usersWithCount:(NSUInteger)count {
    return [[self alloc] initWithCount:count];
}

//- (instancetype)init {
//    self = [super init];
//    
//    [self performBlockWitouthNotifications:^{
//        [self addRandomUsersWithCount:kAVRandomUsersCount];
//    }];
//    
//    return self;
//}

#pragma mark -
#pragma mark Initializations and Deallocations

- (instancetype)init {
    return [self initWithCount:kAVRandomUsersCount];
}

//- (instancetype)initWithUsers:(NSArray *)users {
//    self = [super init];
//    
//    [self performBlockWitouthNotifications:^{
//        [self addUsers:users];
//    }];
//    
//    return self;
//}

- (instancetype)initWithCount:(NSUInteger)count {
    self = [super init];
    
    [self performBlockWitouthNotifications:^{
        [self addRandomUsersWithCount:count];
    }];
    
    return self;
}

#pragma mark -
#pragma mark Public

- (NSArray *)users {
    return [self objects];
}

- (void)addRandomUsersWithCount:(NSUInteger)count {
    for (NSUInteger iterator = 0; iterator < count; iterator++) {
        [self addObject:[AVUser new]];
    }
}

- (void)addUsers:(NSArray *)users {
    for (AVUser *user in users) {
        [self addObject:user];
    }
}

@end
