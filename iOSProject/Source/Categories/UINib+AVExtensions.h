//
//  UINib+AVExtensions.h
//  iOSProject
//
//  Created by Aleksandr Voropaev on 9/8/16.
//  Copyright © 2016 Aleksandr Voropaev. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UINib (AVExtensions)

+ (UINib *)nibWithClass:(Class)cls;

+ (NSArray *)objectsFromNibWithClass:(Class)cls;
+ (id)firstObjectFromNibWithClass:(Class)cls;

@end
