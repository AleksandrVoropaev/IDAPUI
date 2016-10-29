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

//static NSString * const kImageFileURL = @"http://www.freeiconspng.com/uploads/person-outline-icon-png-person-outline-icon-png-person-17.png";
static NSString * const kImageFileURL = @"https://pixabay.com/static/uploads/photo/2014/04/03/00/35/owl-308773_960_720.png";
static NSString * const kImageFileName = @"userImage";
static NSString * const kImageFileExtension = @"png";

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
#define AVDecode(key) [aDecoder decodeObjectForKey:key];
    self.name = AVDecode(kNameKey);
    self.surname = AVDecode(kSurnameKey);
#undef AVDecode

    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
#define AVEncode(object, key) [aCoder encodeObject:object forKey:key];
    AVEncode(self.name, kNameKey);
    AVEncode(self.surname, kSurnameKey);
#undef AVEncode
}

#pragma mark -
#pragma mark Accessors

- (NSString *)fullname {
    return [NSString stringWithFormat:@"%@ %@", self.name, self.surname];
}

- (AVImageModel *)imageModel {
    NSURL *url = [NSURL URLWithString:kImageFileURL];

//    NSURL *url = [[NSBundle mainBundle] URLForResource:kImageFileName withExtension:kImageFileExtension];

    return [AVImageModel imageWithURL:url];
}

@end
