//
//  AVArrayChangesObject+CategoryForUITableView.m
//  iOSProject
//
//  Created by Aleksandr Voropaev on 9/30/16.
//  Copyright © 2016 Aleksandr Voropaev. All rights reserved.
//

#import "AVArrayChangesObject+UITableView.h"

#import "AVSwitchCaseMacro.h"

@interface AVArrayOneIndexChangesObject (UITableView)

@end

@interface AVArrayTwoIndexesChangesObject (UITableView)

@end

@implementation AVArrayChangesObject (UITableView)

- (void)applyToTableView:(UITableView *)tableView {
    [self applyToTableView:tableView withRowAnimation:UITableViewRowAnimationFade];
}

- (void)applyToTableView:(UITableView *)tableView withRowAnimation:(UITableViewRowAnimation)animation {
    [tableView updateWithChangesBlock:^{
        return;
    }];
}

@end

@implementation AVArrayOneIndexChangesObject (UITableView)

- (void)applyToTableView:(UITableView *)tableView withRowAnimation:(UITableViewRowAnimation)animation {
    id paths = @[[NSIndexPath indexPathForRow:self.index inSection:0]];
//    AVBoilerPlate(AVSwitchCase(AVArrayModelChangeDidDeleteObject, { [tableView deleteRowsAtIndexPaths:paths
//                                                                                     withRowAnimation:animation]; });
//                  AVSwitchCase(AVArrayModelChangeDidInsertObject, { [tableView insertRowsAtIndexPaths:paths
//                                                                                     withRowAnimation:animation]; }););
    [tableView updateWithChangesBlock:^{
        switch (self.changesType) {
            AVSwitchCase(AVArrayModelChangeDidDeleteObject,
                 { [tableView deleteRowsAtIndexPaths:paths withRowAnimation:animation]; });
            AVSwitchCase(AVArrayModelChangeDidInsertObject,
                 { [tableView insertRowsAtIndexPaths:paths withRowAnimation:animation]; });
            AVSwitchCaseDefault({ return; });
        }
    }];
}

@end

@implementation AVArrayTwoIndexesChangesObject (UITableView)

- (void)applyToTableView:(UITableView *)tableView withRowAnimation:(UITableViewRowAnimation)animation {
    AVBoilerPlate(AVSwitchCase(AVArrayModelChangeDidMoveObject, {
                        [tableView moveRowAtIndexPath:[NSIndexPath indexPathForRow:self.index inSection:0]
                                          toIndexPath:[NSIndexPath indexPathForRow:self.targetIndex inSection:0]];
    }););
//    [tableView updateWithChangesBlock:^{
//        switch (self.changesType) {
//            AVSwitchCase(AVArrayModelChangeDidMoveObject, {
//                [tableView moveRowAtIndexPath:[NSIndexPath indexPathForRow:self.index inSection:0]
//                                      toIndexPath:[NSIndexPath indexPathForRow:self.targetIndex inSection:0]];
//            });
//            AVSwitchCaseDefault({ return; });
//        }
//    }];
}

@end
