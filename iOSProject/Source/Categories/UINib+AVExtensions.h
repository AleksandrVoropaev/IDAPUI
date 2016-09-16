//
//  UINib+AVExtensions.h
//  iOSProject
//
//  Created by Aleksandr Voropaev on 9/8/16.
//  Copyright © 2016 Aleksandr Voropaev. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UINib (AVExtensions)

+ (nullable UINib *)nibWithClass:(nonnull Class)cls;
+ (nullable UINib *)nibWithClass:(nonnull Class)cls bundle:(nullable NSBundle *)bundle;

+ (nullable id)objectWithClass:(nonnull Class)cls;
+ (nullable id)objectWithClass:(nonnull Class)cls owner:(nullable id)ownerOrNil;
+ (nullable id)objectWithClass:(nonnull Class)cls owner:(nullable id)ownerOrNil options:(nullable NSDictionary *)optionsOrNil;

- (nullable id)objectWithClass:(nonnull Class)cls;
- (nullable id)objectWithClass:(nonnull Class)cls owner:(nullable id)ownerOrNil;
- (nullable id)objectWithClass:(nonnull Class)cls owner:(nullable id)ownerOrNil options:(nullable NSDictionary *)optionsOrNil;

@end
