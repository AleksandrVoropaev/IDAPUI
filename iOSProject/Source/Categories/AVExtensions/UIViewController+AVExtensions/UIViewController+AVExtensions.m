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

+ (instancetype)viewController {
    return [[self alloc] initWithNibName:[self nibName] bundle:nil];
}

+ (NSString *)nibName {
    return NSStringFromClass([self class]);
}

@end
