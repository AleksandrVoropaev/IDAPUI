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

+ (NSArray *)objectsFromNibWithClass:(Class)class {
    UINib *nib = [UINib nibWithClass:class];
    return [nib instantiateWithOwner:nil options:nil];
}

+ (id)firstObjectFromNibWithClass:(Class)class {
    return [[self objectsFromNibWithClass:class] firstObjectWithClass:class];
}

@end
