//
//  UITableView+AVExtensions.m
//  iOSProject
//
//  Created by Aleksandr Voropaev on 9/8/16.
//  Copyright © 2016 Aleksandr Voropaev. All rights reserved.
//

#import "UITableView+AVExtensions.h"

#import "UINib+AVExtensions.h"

@implementation UITableView (AVExtensions)

//- (nullable __kindof UITableViewCell *)dequeueReusableCellWithIdentifier:(NSString *)identifier;  // Used by the delegate to acquire an already allocated cell, in lieu of allocating a new one.

- (nullable __kindof UITableViewCell *)dequeueReusableCellWithClass:(Class)class {
    NSString *identifier = NSStringFromClass(class);
    id cell = [self dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [UINib objectWithClass:class];
    }
    
    return cell;
}

@end
