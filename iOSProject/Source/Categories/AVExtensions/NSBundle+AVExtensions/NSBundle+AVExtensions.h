//
//  NSBundle+AVExtensions.h
//  iOSProject
//
//  Created by Aleksandr Voropaev on 9/15/16.
//  Copyright © 2016 Aleksandr Voropaev. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSBundle (AVExtensions)

+ (id)objectFromNibWithClass:(Class)class;
+ (id)objectFromNibWithClass:(Class)class owner:(id)owner;
+ (id)objectFromNibWithClass:(Class)class owner:(id)owner options:(NSDictionary *)options;

- (id)objectFromNibWithClass:(Class)class;
- (id)objectFromNibWithClass:(Class)class owner:(id)owner;
- (id)objectFromNibWithClass:(Class)class owner:(id)owner options:(NSDictionary *)options;

@end
