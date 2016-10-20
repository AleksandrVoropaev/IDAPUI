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

+ (id)objectFromNibWithClass:(Class)class {
    return [self objectFromNibWithClass:class owner:nil];
}

+ (id)objectFromNibWithClass:(Class)class owner:(id)owner {
    return [self objectFromNibWithClass:class owner:owner options:nil];
}

+ (id)objectFromNibWithClass:(Class)class owner:(id)owner options:(NSDictionary *)options {
    NSString *nibName = NSStringFromClass(class);
    NSBundle *mainB = [self mainBundle];
    NSArray *nibs = [mainB loadNibNamed:nibName owner:owner options:options];
    return [[[self mainBundle] loadNibNamed:nibName owner:owner options:options] firstObjectWithClass:class];
}

#pragma makr -
#pragma mark Public

- (id)objectFromNibWithClass:(Class)class {
    return [self objectFromNibWithClass:class owner:nil];
}

- (id)objectFromNibWithClass:(Class)class owner:(id)owner {
    return [self objectFromNibWithClass:class owner:owner options:nil];
}

- (id)objectFromNibWithClass:(Class)class owner:(id)owner options:(NSDictionary *)options {
    NSString *nibName = NSStringFromClass(class);
    
    return [[self loadNibNamed:nibName owner:owner options:options] firstObjectWithClass:class];
}

@end
