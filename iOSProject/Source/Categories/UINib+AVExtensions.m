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

//+ (UINib *)nibWithNibName:(NSString *)name bundle:(nullable NSBundle *)bundleOrNil;

+ (UINib *)nibWithClass:(Class)cls {
    return [self nibWithClass:cls bundle:nil];
}

+ (UINib *)nibWithClass:(Class)cls bundle:(NSBundle *)bundleOrNil {
    NSString *nibName = NSStringFromClass(cls);
    
    return [self nibWithNibName:nibName bundle:bundleOrNil];
}

+ (NSArray *)objectsWithClass:(Class)class {
    return [self objectsWithClass:class owner:nil];
}

+ (NSArray *)objectsWithClass:(Class)class owner:(nullable id)ownerOrNil {
    return [self objectsWithClass:class owner:ownerOrNil options:nil];
}

+ (NSArray *)objectsWithClass:(Class)class owner:(nullable id)ownerOrNil options:(nullable NSDictionary *)optionsOrNil {
    UINib *nib = [UINib nibWithClass:class];
    return [nib instantiateWithOwner:ownerOrNil options:optionsOrNil];
}

+ (id)objectWithClass:(Class)class {
    return [[self objectsWithClass:class] firstObject];
}

+ (id)objectWithClass:(Class)class owner:(nullable id)ownerOrNil {
    return [[self objectsWithClass:class owner:ownerOrNil] firstObject];
}

+ (id)objectWithClass:(Class)class owner:(nullable id)ownerOrNil options:(nullable NSDictionary *)optionsOrNil {
    return [[self objectsWithClass:class owner:ownerOrNil options:optionsOrNil] firstObject];
}

- (NSArray *)objectsWithClass:(Class)class {
    return [self objectsWithClass:class owner:nil];
}

- (NSArray *)objectsWithClass:(Class)class owner:(nullable id)ownerOrNil {
    return [self objectsWithClass:class owner:ownerOrNil options:nil];
}

- (NSArray *)objectsWithClass:(Class)class owner:(nullable id)ownerOrNil options:(nullable NSDictionary *)optionsOrNil {
    return [self instantiateWithOwner:ownerOrNil options:optionsOrNil];
}

- (id)objectWithClass:(Class)class {
    return [[self objectsWithClass:class] firstObject];
}

- (id)objectWithClass:(Class)class owner:(nullable id)ownerOrNil {
    return [[self objectsWithClass:class owner:ownerOrNil] firstObject];
}

- (id)objectWithClass:(Class)class owner:(nullable id)ownerOrNil options:(nullable NSDictionary *)optionsOrNil {
    return [[self objectsWithClass:class owner:ownerOrNil options:optionsOrNil] firstObject];
}

@end
