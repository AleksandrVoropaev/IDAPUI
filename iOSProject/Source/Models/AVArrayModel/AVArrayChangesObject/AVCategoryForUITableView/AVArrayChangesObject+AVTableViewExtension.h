//
//  AVArrayChangesObject+AVTableViewExtension.h
//  iOSProject
//
//  Created by Aleksandr Voropaev on 9/30/16.
//  Copyright © 2016 Aleksandr Voropaev. All rights reserved.
//

#import "AVArrayChangesObject.h"

@class AVArrayChangesObject;

@interface AVArrayChangesObject (AVTableViewExtension)
//// Need to overwrite in subclasses. Don't call it directly
- (void)applyToTableView:(UITableView *)tableView;

@end
