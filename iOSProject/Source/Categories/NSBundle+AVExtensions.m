//
//  NSBundle+AVExtensions.m
//  iOSProject
//
//  Created by Aleksandr Voropaev on 9/15/16.
//  Copyright © 2016 Aleksandr Voropaev. All rights reserved.
//

#import "NSBundle+AVExtensions.h"

#import <UIKit/UIKit.h>

@implementation NSBundle (AVExtensions)

- (NSArray *)objectsFromNibWithClass:(Class)class owner:(id)owner options:(NSDictionary *)options {
    NSString *nibName = NSStringFromClass(class);
    
    return [[NSBundle mainBundle] loadNibNamed:nibName owner:owner options:options];
}

- (NSArray *)objectsFromNibWithClass:(Class)class owner:(id)owner {
    return [self objectsFromNibWithClass:class owner:owner options:nil];
}

- (NSArray *)objectsFromNibWithClass:(Class)class {
    return [self objectsFromNibWithClass:class owner:nil];
}

- (id)objectFromNibWithClass:(Class)class owner:(id)owner options:(NSDictionary *)options {
    return [[self objectsFromNibWithClass:class owner:owner options:options] firstObject];
}

- (id)objectFromNibWithClass:(Class)class owner:(id)owner {
    return [[self objectsFromNibWithClass:class owner:owner options:nil] firstObject];
}

- (id)objectFromNibWithClass:(Class)class {
    return [[self objectsFromNibWithClass:class owner:nil] firstObject];
}


@end
