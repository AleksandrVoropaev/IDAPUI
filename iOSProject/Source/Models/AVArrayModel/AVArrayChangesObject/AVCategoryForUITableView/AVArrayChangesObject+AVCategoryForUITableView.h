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

#import "UITableView+AVExtensions.h"

@interface AVArrayChangesObject (AVCategoryForUITableView)
// Need to overwrite in subclasses. Don't call it directly
- (void)applyToTableView:(UITableView *)tableView;

@end

@interface AVArrayOneIndexChangesObject (AVCategoryForUITableView)
- (void)applyToTableView:(UITableView *)tableView;

@end

@interface AVArrayTwoIndexesChangesObject (AVCategoryForUITableView)
- (void)applyToTableView:(UITableView *)tableView;

@end
