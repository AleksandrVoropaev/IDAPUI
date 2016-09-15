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

//+ (NSArray *)objectsWithClass:(Class)cls;
//+ (NSArray *)objectsWithClass:(Class)cls owner:(nullable id)ownerOrNil;
//+ (NSArray *)objectsWithClass:(Class)cls owner:(nullable id)ownerOrNil options:(nullable NSDictionary *)optionsOrNil;
+ (id)objectWithClass:(Class)cls;
+ (id)objectWithClass:(Class)cls owner:(nullable id)ownerOrNil;
+ (id)objectWithClass:(Class)cls owner:(nullable id)ownerOrNil options:(nullable NSDictionary *)optionsOrNil;

//- (NSArray *)objectsWithClass:(Class)cls;
//- (NSArray *)objectsWithClass:(Class)cls owner:(nullable id)ownerOrNil;
//- (NSArray *)objectsWithClass:(Class)cls owner:(nullable id)ownerOrNil options:(nullable NSDictionary *)optionsOrNil;
- (id)objectWithClass:(Class)cls;
- (id)objectWithClass:(Class)cls owner:(nullable id)ownerOrNil;
- (id)objectWithClass:(Class)cls owner:(nullable id)ownerOrNil options:(nullable NSDictionary *)optionsOrNil;

@end
