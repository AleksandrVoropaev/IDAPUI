//
//  AVArrayOneIndexChangesObject+AVTableViewExtension.m
//  iOSProject
//
//  Created by Aleksandr Voropaev on 9/30/16.
//  Copyright © 2016 Aleksandr Voropaev. All rights reserved.
//

#import "AVArrayOneIndexChangesObject+AVTableViewExtension.h"

@implementation AVArrayOneIndexChangesObject (AVTableViewExtension)

- (void)applyToTableView:(UITableView *)tableView {
    if (self.changesType == AVArrayModelChangeDidDeleteObject) {
        [tableView deleteRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:self.index inSection:0]]
                         withRowAnimation:UITableViewRowAnimationFade];
    }

    if (self.changesType == AVArrayModelChangeDidInsertObject) {
        [tableView insertRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:self.index inSection:0]]
                         withRowAnimation:UITableViewRowAnimationFade];
    }
}

@end
