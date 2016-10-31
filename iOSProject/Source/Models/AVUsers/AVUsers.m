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

static const NSUInteger kAVRandomUsersCount = 10;
static NSString * const kDataFileName = @"data.plist";

@interface AVUsers ()
@property (nonatomic, strong)   NSMutableDictionary *observers;
@property (nonatomic, readonly) NSArray             *notificationsNames;

@end

@implementation AVUsers

#pragma mark -
#pragma mark Class Methods

+ (instancetype)users {
    return [self new];
}

#pragma mark -
#pragma mark Initializations and Deallocations

- (void)dealloc {
    [self removeObservationWithNotificationNames:self.notificationsNames];

    [self save];
}

- (instancetype)init {
    self = [super init];
    self.observers = [NSMutableDictionary dictionary];

    [self addObservationWithNotificationNames:self.notificationsNames];

    return self;
}

#pragma mark -
#pragma mark Accessors

- (NSArray *)notificationsNames {
    return @[UIApplicationWillTerminateNotification,
             UIApplicationDidEnterBackgroundNotification];
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

- (void)addObservationWithNotificationNames:(NSArray *)notificationNames {
    NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
    for (NSString *name in notificationNames) {
        [self.observers setObject:[center addObserverForName:name
                                                      object:nil
                                                       queue:nil
                                                  usingBlock:^(NSNotification * _Nonnull note) {
                                                      [self save];
                                                  }]
                           forKey:name];
    }
}

- (void)removeObservationWithNotificationNames:(NSArray *)notificationNames {
    for (NSString *name in notificationNames) {
        [[NSNotificationCenter defaultCenter] removeObserver:[self.observers objectForKey:name]
                                                        name:name
                                                      object:nil];
        [self.observers removeObjectForKey:name];
    }
}

- (void)performLoading {
    //need to remove -------------------------------------
    sleep(2);
    //----------------------------------------------------

    NSArray *objects = [NSKeyedUnarchiver unarchiveObjectWithFile:[NSFileManager applicationDataFilePath:kDataFileName]];

    if (objects && objects.count) {
        [self addObjects:objects];
    } else {
        [self performBlockWithoutNotifications:^{
            [self addRandomUsersWithCount:kAVRandomUsersCount];
        }];
    }
    
    self.state = AVModelStateDidLoad;
}

- (void)save {
    //////////////////////////////////////////////////////////////////////////////////////
    //////////////////////////////////////////////////////////////////////////////////////
//    [self removeAll];
    //////////////////////////////////////////////////////////////////////////////////////
    //////////////////////////////////////////////////////////////////////////////////////

    [NSKeyedArchiver archiveRootObject:self.objects toFile:[NSFileManager applicationDataFilePath:kDataFileName]];
}

@end
