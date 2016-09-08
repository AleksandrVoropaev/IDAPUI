//
//  UINib+AVExtensions.m
//  iOSProject
//
//  Created by Aleksandr Voropaev on 9/8/16.
//  Copyright © 2016 Aleksandr Voropaev. All rights reserved.
//

#import "UINib+AVExtensions.h"

@implementation UINib (AVExtensions)

//+ (UINib *)nibWithNibName:(NSString *)name bundle:(nullable NSBundle *)bundleOrNil;

+ (UINib *)nibWithNibNameFromClassName:(Class)cls {
    NSString *nibName = NSStringFromClass(cls);
    return [self nibWithNibName:nibName bundle:nil];
}

@end
