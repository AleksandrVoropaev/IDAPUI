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
    NSString *nibName = NSStringFromClass(cls);
    return [self nibWithNibName:nibName bundle:nil];
}

+ (NSArray *)objectsWithClass:(Class)class {
    UINib *nib = [UINib nibWithClass:class];
    return [nib instantiateWithOwner:nil options:nil];
}

+ (id)firstObjectWithClass:(Class)class {
    return [[self objectsWithClass:class] firstObjectWithClass:class];
}

- (NSArray *)objectsWithOwner:(nullable id)ownerOrNil {
    return [self instantiateWithOwner:ownerOrNil options:nil];
}

- (NSArray *)objectsWithClass:(Class)class owner:(nullable id)ownerOrNil {
    return [[self objectsWithOwner:ownerOrNil] objectsWithClass:class];
}

- (id)firstObjectWithClass:(Class)class owner:(nullable id)ownerOrNil {
    return [[self objectsWithClass:class owner:ownerOrNil] firstObject];
}

@end
