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

- (nullable __kindof UITableViewCell *)dequeueReusableCellWithClass:(Class)cls {
    NSString *identifier = NSStringFromClass(cls);
    return [self dequeueReusableCellWithIdentifier:identifier];
}

- (id)dequeueReusableCellFromTableViewOrCreateNewFromNibWithClass:(Class)class {
    id cell = [self dequeueReusableCellWithClass:class];
    
    if (!cell) {
        cell = [UINib firstObjectFromNibWithClass:class];
    }
    
    return cell;
}

@end
