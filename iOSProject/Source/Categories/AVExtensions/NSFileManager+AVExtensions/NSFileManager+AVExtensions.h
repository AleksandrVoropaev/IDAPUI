//
//  NSFileManager+AVExtensions.h
//  iOSProject
//
//  Created by Aleksandr Voropaev on 10/14/16.
//  Copyright © 2016 Aleksandr Voropaev. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSFileManager (AVExtensions)

+ (NSURL *)URLForApplicationDataDirectory:(NSSearchPathDirectory)directory
                                inDomains:(NSSearchPathDomainMask)domainMask;

+ (NSURL *)specifyURL:(NSURL *)url withFolderName:(NSString *)folderName;
+ (NSURL *)specifyURLWithBundleID:(NSURL *)url;

+ (NSURL *)URLForApplicationSupportDirectory;
+ (NSURL *)URLForApplicationSupportDirectoryWithFolderName:(NSString *)folderName;
+ (NSURL *)URLForLibraryDirectory;
+ (NSURL *)URLForLibraryDirectoryWithFolderName:(NSString *)folderName;

+ (NSString *)applicationDataFilePath:(NSString *)fileName;

@end
