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

+ (NSArray *)objectsWithClass:(Class)cls;
+ (id)firstObjectWithClass:(Class)cls;

- (NSArray *)objectsWithOwner:(nullable id)ownerOrNil;
- (NSArray *)objectsWithClass:(Class)cls owner:(nullable id)ownerOrNil;
- (id)firstObjectWithClass:(Class)cls owner:(nullable id)ownerOrNil;

@end
