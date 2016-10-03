//
//  AVArrayChangesObject+CategoryForUITableView.m
//  iOSProject
//
//  Created by Aleksandr Voropaev on 9/30/16.
//  Copyright © 2016 Aleksandr Voropaev. All rights reserved.
//

#import "AVArrayChangesObject+AVCategoryForUITableView.h"

#import "AVSwitchCaseMacro.h"

@interface AVArrayOneIndexChangesObject (AVCategoryForUITableView)

@end

@interface AVArrayTwoIndexesChangesObject (AVCategoryForUITableView)

@end

@implementation AVArrayChangesObject (AVCategoryForUITableView)

- (void)applyToTableView:(UITableView *)tableView {
    [self applyToTableView:tableView withRowAnimation:UITableViewRowAnimationFade];
}

- (void)applyToTableView:(UITableView *)tableView withRowAnimation:(UITableViewRowAnimation)animation {
    [tableView updateWithChangesBlock:^{
        return;
    }];
}

- (void)applyToModel:(AVArrayModel *)model {
    return;
}

@end

@implementation AVArrayOneIndexChangesObject (AVCategoryForUITableView)

- (void)applyToTableView:(UITableView *)tableView withRowAnimation:(UITableViewRowAnimation)animation {
    id paths = @[[NSIndexPath indexPathForRow:self.index inSection:0]];
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

- (void)applyToModel:(AVArrayModel *)model {
    id object = self.object;
    NSUInteger index = self.index;
    switch (self.changesType) {
        AVSwitchCase(AVArrayModelChangeDidDeleteObject, { [model removeObject:object]; });
        AVSwitchCase(AVArrayModelChangeDidInsertObject, { [model insertObject:object atIndex:index]; });
        AVSwitchCaseDefault({ return; });
    }
}

@end

@implementation AVArrayTwoIndexesChangesObject (AVCategoryForUITableView)

- (void)applyToTableView:(UITableView *)tableView withRowAnimation:(UITableViewRowAnimation)animation {
    [tableView updateWithChangesBlock:^{
        switch (self.changesType) {
            AVSwitchCase(AVArrayModelChangeDidMoveObject, {
                [tableView moveRowAtIndexPath:[NSIndexPath indexPathForRow:self.index inSection:0]
                                      toIndexPath:[NSIndexPath indexPathForRow:self.targetIndex inSection:0]];
            });
            AVSwitchCaseDefault({ return; });
        }
    }];
}

- (void)applyToModel:(AVArrayModel *)model {
    NSUInteger index = self.index;
    NSUInteger targetIndex = self.targetIndex;
    switch (self.changesType) {
        AVSwitchCase(AVArrayModelChangeDidMoveObject, { [model moveObjectFromIndex:index toIndex:targetIndex]; });
        AVSwitchCaseDefault({ return; });
    }
}

@end
