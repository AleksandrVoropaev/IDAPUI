//
//  AVUsers.m
//  iOSProject
//
//  Created by Aleksandr Voropaev on 9/12/16.
//  Copyright © 2016 Aleksandr Voropaev. All rights reserved.
//

#import "AVUsers.h"

#import "AVUser.h"

@implementation AVUsers

//+ (instancetype)usersWithCount:(NSUInteger)count {
//    return [[self alloc] initWithCount:count];
//}

- (instancetype)init {
    self = [super init];
    [self addUsersWithCount:20];
    
    return self;
}

//- (instancetype)initWithCount:(NSUInteger)count {
//    self = [super init];
//    [self addUsersWithCount:count];
//    
//    return self;
//}

- (NSArray *)users {
    return [self objects];
}

- (void)addUsersWithCount:(NSUInteger)count {
    for (NSUInteger iterator = 0; iterator < count; iterator++) {
        [self addObject:[AVUser new]];
    }
}

@end
