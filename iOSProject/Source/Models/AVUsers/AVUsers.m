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
    [self save];
}

- (instancetype)init {
    self = [super init];
//    NSArray *objects = [NSKeyedUnarchiver unarchiveObjectWithFile:@"/Users/Aleksandr/IDAPUI/iOSProject/Source/Models/data.plist"];
//    NSArray *objects = [NSKeyedUnarchiver unarchiveObjectWithFile:NSSearchPathForDirectoriesInDomains(<#NSSearchPathDirectory directory#>, NSSearchPathDomainMask domainMask, <#BOOL expandTilde#>)];
    NSArray *objects = [NSKeyedUnarchiver unarchiveObjectWithFile:[self applicationDataFilePath]];

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
    [NSKeyedArchiver archiveRootObject:self.objects toFile:[self applicationDataFilePath]];
}

#pragma mark -
#pragma mark Private

- (NSURL *)applicationDataDirectory {
    NSFileManager* sharedFM = [NSFileManager defaultManager];
    NSArray* possibleURLs = [sharedFM URLsForDirectory:NSApplicationSupportDirectory
                                             inDomains:NSUserDomainMask];
    NSURL* appSupportDir = nil;
    NSURL* appDirectory = nil;
    
    if ([possibleURLs count] >= 1) {
        // Use the first directory (if multiple are returned)
        appSupportDir = [possibleURLs objectAtIndex:0];
    }
    
    // If a valid app support directory exists, add the
    // app's bundle ID to it to specify the final directory.
    if (appSupportDir) {
        NSString* appBundleID = [[NSBundle mainBundle] bundleIdentifier];
        appDirectory = [appSupportDir URLByAppendingPathComponent:appBundleID];
    }
    
    if (![sharedFM fileExistsAtPath:appDirectory.path]) {
        [sharedFM createDirectoryAtPath:appDirectory.path
            withIntermediateDirectories:YES
                             attributes:nil
                                  error:nil];
    }
    
    return appDirectory;
}

- (NSString *)applicationDataFilePath {
    NSString *dataDirectoryPath = [self applicationDataDirectory].path;
    
    return [dataDirectoryPath stringByAppendingPathComponent:kDataFileName];
}

@end
