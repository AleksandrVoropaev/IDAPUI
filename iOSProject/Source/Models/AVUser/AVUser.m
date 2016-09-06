//
//  AVUser.m
//  iOSProject
//
//  Created by Aleksandr Voropaev on 9/6/16.
//  Copyright © 2016 Aleksandr Voropaev. All rights reserved.
//

#import "AVUser.h"

@implementation AVUser

@dynamic fullname;
@dynamic image;

#pragma mark -
#pragma mark Initializations and Deallocations

- (instancetyspe)init {
    self = [super init];
    
    if (self) {
        self.name = [NSString randomName];
        self.surname = [NSString randomName];
    }
    
    return self;
}

#pragma mark -
#pragma mark Accessors

- (NSString *)fullname {
    return [NSString stringWithFormat:@"%@ %@", self.name, self.surname];
}

- (UIImage *)image {
    NSString *path = [[NSBundle mainBundle] pathForResource:@"userImage" ofType:@"png"];
    
    return [UIImage imageWithContentsOfFile:path];
}

@end
