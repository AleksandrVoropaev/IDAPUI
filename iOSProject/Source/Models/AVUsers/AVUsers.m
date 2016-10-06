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
    [self encodeWithCoder:(nonnull NSCoder *)];
    
    [super dealloc];
}

- (instancetype)init {
    return [self initWithCount:kAVRandomUsersCount];
}

- (instancetype)initWithCount:(NSUInteger)count {
    self = [super init];
    
    [self performBlockWithoutNotifications:^{
        [self addRandomUsersWithCount:count];
    }];
    
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super init];
    
    self.objects = [aDecoder decodeArrayOfObjCType:<#(nonnull const char *)#> count:<#(NSUInteger)#> at:<#(nonnull void *)#>];
    
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
    NSInteger count = 5;
    [aCoder encodeArrayOfObjCType:@"NSArray" count:count at:(__bridge const void * _Nonnull)(self.objects)];
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

@end
