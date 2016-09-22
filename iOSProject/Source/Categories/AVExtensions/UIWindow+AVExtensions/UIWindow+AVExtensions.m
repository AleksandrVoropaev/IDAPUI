//
//  UIWindow+AVExtensions.m
//  iOSProject
//
//  Created by Aleksandr Voropaev on 9/13/16.
//  Copyright © 2016 Aleksandr Voropaev. All rights reserved.
//

#import "UIWindow+AVExtensions.h"

@implementation UIWindow (AVExtensions)

+ (instancetype)window {
    return [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
}

@end
