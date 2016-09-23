//
//  UINib+AVExtensions.m
//  iOSProject
//
//  Created by Aleksandr Voropaev on 9/8/16.
//  Copyright © 2016 Aleksandr Voropaev. All rights reserved.
//

#import "UINib+AVExtensions.h"

#import "NSArray+AVExtensions.h"

@implementation UINib (AVExtensions)

#pragma mark -
#pragma mark Class Methods

+ (UINib *)nibWithClass:(Class)cls {
    return [self nibWithClass:cls bundle:nil];
}

+ (UINib *)nibWithClass:(Class)cls bundle:(NSBundle *)bundleOrNil {
    NSString *nibName = NSStringFromClass(cls);
    
    return [self nibWithNibName:nibName bundle:bundleOrNil];
}

+ (id)objectWithClass:(Class)class {
    return [self objectWithClass:class owner:nil];
}

+ (id)objectWithClass:(Class)class owner:(nullable id)ownerOrNil {
    return [self objectWithClass:class owner:ownerOrNil options:nil];
}

+ (id)objectWithClass:(Class)class owner:(nullable id)ownerOrNil options:(nullable NSDictionary *)optionsOrNil {
    return [[[self nibWithClass:class] instantiateWithOwner:ownerOrNil options:optionsOrNil] firstObjectWithClass:class];
}

#pragma mark -
#pragma mark Public

- (id)objectWithClass:(Class)class {
    return [self objectWithClass:class owner:nil];
}

- (id)objectWithClass:(Class)class owner:(nullable id)ownerOrNil {
    return [self objectWithClass:class owner:ownerOrNil options:nil];
}

- (id)objectWithClass:(Class)class owner:(nullable id)ownerOrNil options:(nullable NSDictionary *)optionsOrNil {
    return [[self instantiateWithOwner:ownerOrNil options:optionsOrNil] firstObjectWithClass:class];
}

@end
