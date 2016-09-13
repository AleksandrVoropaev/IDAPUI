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

+ (instancetype)usersWithCount:(NSUInteger)count {
    return [[self alloc] initWithCount:count];
}

- (instancetype)initWithCount:(NSUInteger)count {
    self = [super init];
    [self addUsersWithCount:count];
    
    return self;
}


- (void)addUsersWithCount:(NSUInteger)count {
    for (NSUInteger iterator = 0; iterator < count; iterator++) {
        [self addObject:[AVUser new]];
    }
}

@end
