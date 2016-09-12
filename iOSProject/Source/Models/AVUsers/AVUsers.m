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

- (void)addUsersWithCount:(NSUInteger)count {
    for (NSUInteger iterator = 0; iterator < count; iterator++) {
        [self addObject:[AVUser new]];
    }
}

@end
