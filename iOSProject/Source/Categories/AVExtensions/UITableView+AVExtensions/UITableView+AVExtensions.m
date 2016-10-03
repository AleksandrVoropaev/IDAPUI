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

- (nullable __kindof UITableViewCell *)dequeueReusableCellWithClass:(Class)class {
    NSString *identifier = NSStringFromClass(class);
    id cell = [self dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [UINib objectWithClass:class];
    }
    
    return cell;
}

- (void)updateWithChangesBlock:(void (^)(void))block {
    if (!block) {
        return;
    }
    
    [self beginUpdates];
    block();
    [self endUpdates];
}

@end
