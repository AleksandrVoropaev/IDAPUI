//
//  AVArrayChangesObject+CategoryForUITableView.m
//  iOSProject
//
//  Created by Aleksandr Voropaev on 9/30/16.
//  Copyright © 2016 Aleksandr Voropaev. All rights reserved.
//

#define AVImplementationSynthesize(className, ...) \
    @interface className (UITableView) \
    @end \
    @implementation className (UITableView) \
    - (void)applyToTableView:(UITableView *)tableView withRowAnimation:(UITableViewRowAnimation)animation { \
        id paths = @[[NSIndexPath indexPathForRow:self.index inSection:0]]; \
        [tableView updateWithChangesBlock:^{ \
            switch (self.changesType) { \
                __VA_ARGS__; \
                AVSwitchCaseDefault({ return; }); \
            } \
        }]; \
    } \
    @end

#import "AVArrayChangesObject+UITableView.h"

#import "AVSwitchCaseMacro.h"

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

AVImplementationSynthesize(AVArrayOneIndexChangesObject,
                           AVSwitchCase(AVArrayModelChangeDidDeleteObject,
                                        { [tableView deleteRowsAtIndexPaths:paths
                                                           withRowAnimation:animation]; });
                           AVSwitchCase(AVArrayModelChangeDidInsertObject,
                                        { [tableView insertRowsAtIndexPaths:paths
                                                           withRowAnimation:animation]; }););

AVImplementationSynthesize(AVArrayTwoIndexesChangesObject,
                           AVSwitchCase(AVArrayModelChangeDidMoveObject,
                                        { [tableView moveRowAtIndexPath:[NSIndexPath indexPathForRow:self.index
                                                                                           inSection:0]
                                                            toIndexPath:[NSIndexPath indexPathForRow:self.targetIndex
                                                                                           inSection:0]]; }););
