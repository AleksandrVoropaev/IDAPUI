//
//  NSFileManager+AVExtensions.m
//  iOSProject
//
//  Created by Aleksandr Voropaev on 10/14/16.
//  Copyright © 2016 Aleksandr Voropaev. All rights reserved.
//

#import "NSFileManager+AVExtensions.h"

static NSString * const kDataFolderName = @"appData";

@implementation NSFileManager (AVExtensions)

+ (NSURL *)applicationDataDirectoryURL:(NSSearchPathDirectory)directory
                             inDomains:(NSSearchPathDomainMask)domainMask
{
    NSFileManager* fileManager = [NSFileManager defaultManager];
    NSArray* possibleURLs = [fileManager URLsForDirectory:directory
                                                inDomains:domainMask];
    NSURL* applicationDirectory = nil;
    
    if ([possibleURLs count] >= 1) {
        applicationDirectory = [possibleURLs objectAtIndex:0];
    }
    
    [self createFolderIfDoesNotExistsAtPath:applicationDirectory.path];
    
    return applicationDirectory;
}

+ (NSURL *)specifyURL:(NSURL *)url withFolderName:(NSString *)folderName {
    return [url URLByAppendingPathComponent:folderName];
}

+ (NSURL *)specifyURLWithBundleID:(NSURL *)url {
    return [self specifyURL:url withFolderName:[[NSBundle mainBundle] bundleIdentifier]];
}

+ (NSURL *)applicationSupportDirectoryURL {
    static dispatch_once_t onceToken;
    static NSURL *applicationSupportDirectory = nil;
    dispatch_once(&onceToken, ^{
        applicationSupportDirectory = [self applicationDataDirectoryURL:NSApplicationSupportDirectory
                                                              inDomains:NSUserDomainMask];
    });
    
    return applicationSupportDirectory;
}

+ (NSURL *)applicationSupportDirectoryURLWithFolderName:(NSString *)folderName {
    return [self specifyURL:[self applicationSupportDirectoryURL] withFolderName:folderName];
}

+ (NSURL *)libraryDirectoryURL {
    static dispatch_once_t onceToken;
    static NSURL *libraryDirectory = nil;
    dispatch_once(&onceToken, ^{
        libraryDirectory = [self applicationDataDirectoryURL:NSLibraryDirectory inDomains:NSUserDomainMask];
    });
    
    return libraryDirectory;
}

+ (NSURL *)libraryDirectoryURLWithFolderName:(NSString *)folderName {
    return [self specifyURL:[self libraryDirectoryURL] withFolderName:folderName];
}

+ (NSString *)applicationDataFilePath:(NSString *)fileName {
    static dispatch_once_t onceToken;
    static NSString *dataDirectoryPath = nil;
    dispatch_once(&onceToken, ^{
        dataDirectoryPath = [self libraryDirectoryURLWithFolderName:kDataFolderName].path;
        [self createFolderIfDoesNotExistsAtPath:dataDirectoryPath];
    });
    
    return [dataDirectoryPath stringByAppendingPathComponent:fileName];
}

+ (void)createFolderIfDoesNotExistsAtPath:(NSString *)path {
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if (![fileManager fileExistsAtPath:path]) {
        [fileManager createDirectoryAtPath:path
               withIntermediateDirectories:YES
                                attributes:nil
                                     error:nil];
    }
}

@end
