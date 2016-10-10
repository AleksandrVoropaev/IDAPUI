//
//  AVUser.m
//  iOSProject
//
//  Created by Aleksandr Voropaev on 9/6/16.
//  Copyright © 2016 Aleksandr Voropaev. All rights reserved.
//

#import "AVUser.h"

#import "AVImageModel.h"

#import "NSString+AVRandomName.h"

static NSString * const kNameKey = @"name";
static NSString * const kSurnameKey = @"surname";

@implementation AVUser

@dynamic fullname;
@dynamic imageModel;

#pragma mark -
#pragma mark Initializations and Deallocations

- (instancetype)init {
    self = [super init];
    
    if (self) {
        self.name = [NSString randomName];
        self.surname = [NSString randomName];
    }
    
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self.name = [aDecoder decodeObjectForKey:kNameKey];
    self.surname = [aDecoder decodeObjectForKey:kSurnameKey];

    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:self.name forKey:kNameKey];
    [aCoder encodeObject:self.name forKey:kSurnameKey];
}

#pragma mark -
#pragma mark Accessors

- (NSString *)fullname {
    return [NSString stringWithFormat:@"%@ %@", self.name, self.surname];
}

- (AVImageModel *)imageModel {
    NSURL *url = [[NSBundle mainBundle] URLForResource:@"userImage" withExtension:@"png"];
    
    return [AVImageModel imageWithURL:url];
}

@end
