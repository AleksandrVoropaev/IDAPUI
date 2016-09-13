//
//  UIViewController+AVExtensions.m
//  iOSProject
//
//  Created by Aleksandr Voropaev on 9/13/16.
//  Copyright © 2016 Aleksandr Voropaev. All rights reserved.
//

#import "UIViewController+AVExtensions.h"

#import "UINib+AVExtensions.h"

@implementation UIViewController (AVExtensions)

+ (instancetype)viewControllerWithNibClass:(Class)class {
    return [[self alloc] initWithNibName:NSStringFromClass(class) bundle:nil];
}

+ (instancetype)viewControllerWithNib {
    return [self viewControllerWithNibClass:[self class]];
}

@end
