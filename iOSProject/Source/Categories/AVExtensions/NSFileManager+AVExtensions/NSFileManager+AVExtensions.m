//
//  NSFileManager+AVExtensions.m
//  iOSProject
//
//  Created by Aleksandr Voropaev on 10/14/16.
//  Copyright © 2016 Aleksandr Voropaev. All rights reserved.
//

#import "NSFileManager+AVExtensions.h"

static NSString * const kDataFolderName = @"addData";

@implementation NSFileManager (AVExtensions)

+ (NSURL *)URLForApplicationDataDirectory:(NSSearchPathDirectory)directory
                                inDomains:(NSSearchPathDomainMask)domainMask
{
    NSFileManager* sharedFM = [NSFileManager defaultManager];
    NSArray* possibleURLs = [sharedFM URLsForDirectory:directory
                                             inDomains:domainMask];
    NSURL* appDirectory = nil;
    
    if ([possibleURLs count] >= 1) {
        // Use the first directory (if multiple are returned)
        appDirectory = [possibleURLs objectAtIndex:0];
    }
    
    [self createFolderIfDoesNotExistsAtPath:appDirectory.path];
    
    return appDirectory;
}

+ (NSURL *)specifyURL:(NSURL *)url withFolderName:(NSString *)folderName {
    return [url URLByAppendingPathComponent:folderName];
}

+ (NSURL *)specifyURLWithBundleID:(NSURL *)url {
    return [self specifyURL:url withFolderName:[[NSBundle mainBundle] bundleIdentifier]];
}

+ (NSURL *)URLForApplicationSupportDirectory {
    return [self URLForApplicationDataDirectory:NSApplicationSupportDirectory inDomains:NSUserDomainMask];
}

+ (NSURL *)URLForApplicationSupportDirectoryWithFolderName:(NSString *)folderName {
    return [self specifyURL:[self URLForApplicationSupportDirectory] withFolderName:folderName];
}

+ (NSURL *)URLForLibraryDirectory {
    return [self URLForApplicationDataDirectory:NSLibraryDirectory inDomains:NSUserDomainMask];
}

+ (NSURL *)URLForLibraryDirectoryWithFolderName:(NSString *)folderName {
    return [self specifyURL:[self URLForLibraryDirectory] withFolderName:folderName];
}

+ (NSString *)applicationDataFilePath:(NSString *)fileName {
    NSString *dataDirectoryPath = [self URLForLibraryDirectoryWithFolderName:kDataFolderName].path;
    [self createFolderIfDoesNotExistsAtPath:dataDirectoryPath];
    
    return [dataDirectoryPath stringByAppendingPathComponent:fileName];
}

+ (void)createFolderIfDoesNotExistsAtPath:(NSString *)path {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSFileManager *fileManager = [NSFileManager defaultManager];
        
        if (![fileManager fileExistsAtPath:path]) {
            [fileManager createDirectoryAtPath:path
                   withIntermediateDirectories:YES
                                    attributes:nil
                                         error:nil];
        }
    });
}

@end
