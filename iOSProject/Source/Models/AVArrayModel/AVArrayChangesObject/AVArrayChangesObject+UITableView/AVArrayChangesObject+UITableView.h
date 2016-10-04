//
//  AVArrayChangesObject+CategoryForUITableView.h
//  iOSProject
//
//  Created by Aleksandr Voropaev on 9/30/16.
//  Copyright © 2016 Aleksandr Voropaev. All rights reserved.
//

#import "AVArrayChangesObject.h"
#import "AVArrayOneIndexChangesObject.h"
#import "AVArrayTwoIndexesChangesObject.h"

#import "AVArrayModel.h"

#import "UITableView+AVExtensions.h"

#define AVBoilerPlate(...) \
[tableView updateWithChangesBlock:^{ \
switch (self.changesType) { \
        __VA_ARGS__; \
        AVSwitchCaseDefault({ return; }); \
} \
}];

@interface AVArrayChangesObject (UITableView)

// Need to overwrite in subclasses. Don't call it directly
- (void)applyToTableView:(UITableView *)tableView;
- (void)applyToTableView:(UITableView *)tableView withRowAnimation:(UITableViewRowAnimation)animation;

@end
