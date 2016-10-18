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
#import "NSFileManager+AVExtensions.h"

static const NSUInteger kAVRandomUsersCount = 5;
static NSString * const kDataFileName = @"data.plist";

@implementation AVUsers

#pragma mark -
#pragma mark Class Methods

+ (instancetype)users {
    return [self new];
}

#pragma mark -
#pragma mark Initializations and Deallocations

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    [self save];
}

- (instancetype)init {
    self = [super init];

    [self load];
    
//    self.localeChangeObserver = [center addObserverForName:NSCurrentLocaleDidChangeNotification
//                                                    object:nil
//                                                     queue:mainQueue
//                                                usingBlock:^(NSNotification *note) {
//                                                    NSLog(@"The user's locale changed to: %@", [[NSLocale currentLocale] localeIdentifier]);
//                                                }];


    NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
    NSOperationQueue *mainQueue = [NSOperationQueue mainQueue];
//    [center addObserverForName:NSCurrentLocaleDidChangeNotification
//                        object:nil
//                         queue:mainQueue
//                    usingBlock:^(NSNotification * _Nonnull note) {
//                        [self save];
//                    }];
    [center addObserver:self
               selector:@selector(save)
                   name:UIApplicationWillTerminateNotification
                 object:nil];
    
    [center addObserver:self
               selector:@selector(save)
                   name:UIApplicationDidEnterBackgroundNotification
                 object:nil];

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

- (void)load {
    NSArray *objects = [NSKeyedUnarchiver unarchiveObjectWithFile:[NSFileManager applicationDataFilePath:kDataFileName]];

    if (objects && objects.count) {
        [self addObjects:objects];
    } else {
        [self performBlockWithoutNotifications:^{
            [self addRandomUsersWithCount:kAVRandomUsersCount];
        }];
    }
}

- (void)save {
    [NSKeyedArchiver archiveRootObject:self.objects toFile:[NSFileManager applicationDataFilePath:kDataFileName]];
}

@end
