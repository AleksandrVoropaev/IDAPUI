//
//  NSBundle+AVExtensions.m
//  iOSProject
//
//  Created by Aleksandr Voropaev on 9/15/16.
//  Copyright © 2016 Aleksandr Voropaev. All rights reserved.
//

#import "NSBundle+AVExtensions.h"

#import <UIKit/UIKit.h>

#import "NSArray+AVExtensions.h"

@implementation NSBundle (AVExtensions)

#pragma makr -
#pragma mark Class Methods

+ (NSArray *)objectsFromNibWithClass:(Class)class owner:(id)owner options:(NSDictionary *)options {
    NSString *nibName = NSStringFromClass(class);
    
    return [[NSBundle mainBundle] loadNibNamed:nibName owner:owner options:options];
}

+ (NSArray *)objectsFromNibWithClass:(Class)class owner:(id)owner {
    return [self objectsFromNibWithClass:class owner:owner options:nil];
}

+ (NSArray *)objectsFromNibWithClass:(Class)class {
    return [self objectsFromNibWithClass:class owner:nil];
}

+ (id)objectFromNibWithClass:(Class)class owner:(id)owner options:(NSDictionary *)options {
    return [[self objectsFromNibWithClass:class owner:owner options:options] firstObjectWithClass:class];
}

+ (id)objectFromNibWithClass:(Class)class owner:(id)owner {
    return [[self objectsFromNibWithClass:class owner:owner options:nil] firstObjectWithClass:class];
}

+ (id)objectFromNibWithClass:(Class)class {
    return [[self objectsFromNibWithClass:class owner:nil] firstObjectWithClass:class];
}

#pragma makr -
#pragma mark Private

- (NSArray *)objectsFromNibWithClass:(Class)class owner:(id)owner options:(NSDictionary *)options {
    NSString *nibName = NSStringFromClass(class);
    
    return [self loadNibNamed:nibName owner:owner options:options];
}

- (NSArray *)objectsFromNibWithClass:(Class)class owner:(id)owner {
    return [self objectsFromNibWithClass:class owner:owner options:nil];
}

- (NSArray *)objectsFromNibWithClass:(Class)class {
    return [self objectsFromNibWithClass:class owner:nil];
}

#pragma makr -
#pragma mark Public

- (id)objectFromNibWithClass:(Class)class owner:(id)owner options:(NSDictionary *)options {
    return [[self objectsFromNibWithClass:class owner:owner options:options] firstObjectWithClass:class];
}

- (id)objectFromNibWithClass:(Class)class owner:(id)owner {
    return [[self objectsFromNibWithClass:class owner:owner options:nil] firstObjectWithClass:class];
}

- (id)objectFromNibWithClass:(Class)class {
    return [[self objectsFromNibWithClass:class owner:nil] firstObjectWithClass:class];
}

@end
