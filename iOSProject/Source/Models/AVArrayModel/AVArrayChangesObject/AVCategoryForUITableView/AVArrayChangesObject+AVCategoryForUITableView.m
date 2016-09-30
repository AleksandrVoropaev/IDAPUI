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
    [tableView updateWithChangesBlock:^{
        return;
    }];
}

@end

@implementation AVArrayOneIndexChangesObject (AVCategoryForUITableView)

- (void)applyToTableView:(UITableView *)tableView {
    [tableView updateWithChangesBlock:^{
        if (self.changesType == AVArrayModelChangeDidDeleteObject) {
            [tableView deleteRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:self.index inSection:0]]
                             withRowAnimation:UITableViewRowAnimationFade];
        }
        
        if (self.changesType == AVArrayModelChangeDidInsertObject) {
            [tableView insertRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:self.index inSection:0]]
                             withRowAnimation:UITableViewRowAnimationFade];
        }
    }];
}

@end

@implementation AVArrayTwoIndexesChangesObject (AVCategoryForUITableView)

- (void)applyToTableView:(UITableView *)tableView {
    [tableView updateWithChangesBlock:^{
        if (self.changesType == AVArrayModelChangeDidMoveObject) {
            [tableView moveRowAtIndexPath:[NSIndexPath indexPathForRow:self.index inSection:0]
                              toIndexPath:[NSIndexPath indexPathForRow:self.targetIndex inSection:0]];
        }
    }];
}

@end
