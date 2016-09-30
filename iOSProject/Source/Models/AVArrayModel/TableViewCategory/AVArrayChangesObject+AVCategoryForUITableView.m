//
//  AVArrayChangesObject+CategoryForUITableView.m
//  iOSProject
//
//  Created by Aleksandr Voropaev on 9/30/16.
//  Copyright © 2016 Aleksandr Voropaev. All rights reserved.
//

#import "AVArrayChangesObject+AVCategoryForUITableView.h"

@implementation AVArrayChangesObject (AVCategoryForUITableView)

- (void)applyToTableView:(UITableView *)tableView {
    return;
}

@end

@implementation AVArrayOneIndexChangesObject (AVCategoryForUITableView)

- (void)applyToTableView:(UITableView *)tableView {
    if (self.changesType == AVArrayModelChangeDidDeleteObject) {
        [tableView deleteRowsAtIndexPaths:@[[NSIndexPath indexPathWithIndex:self.index]]
                         withRowAnimation:UITableViewRowAnimationFade];
    }
    
    if (self.changesType == AVArrayModelChangeDidInsertObject) {
        [tableView insertRowsAtIndexPaths:@[[NSIndexPath indexPathWithIndex:self.index]]
                         withRowAnimation:UITableViewRowAnimationFade];
    }
}

@end

@implementation AVArrayTwoIndexesChangesObject (AVCategoryForUITableView)

- (void)applyToTableView:(UITableView *)tableView {
    if (self.changesType == AVArrayModelChangeDidMoveObject) {
        [tableView moveRowAtIndexPath:[NSIndexPath indexPathWithIndex:self.index]
                          toIndexPath:[NSIndexPath indexPathWithIndex:self.targetIndex]];
    }
}

@end
