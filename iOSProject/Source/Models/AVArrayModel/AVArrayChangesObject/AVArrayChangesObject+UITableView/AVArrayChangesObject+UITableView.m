//
//  AVArrayChangesObject+CategoryForUITableView.m
//  iOSProject
//
//  Created by Aleksandr Voropaev on 9/30/16.
//  Copyright © 2016 Aleksandr Voropaev. All rights reserved.
//

#import "AVArrayChangesObject+UITableView.h"

#import "AVSwitchCaseMacro.h"

#define AVArrayModelCategoryInterfaceSynthesize(className) \
    @interface className (UITableView) \
    @end \

#define AVArrayModelCategoryImplementationSynthesize(className, impl) \
    @implementation className (UITableView) \
    - (void)applyToTableView:(UITableView *)tableView { \
        [self applyToTableView:tableView withRowAnimation:UITableViewRowAnimationFade]; \
    } \
    - (void)applyToTableView:(UITableView *)tableView withRowAnimation:(UITableViewRowAnimation)animation { \
        impl \
    } \
    @end

#define AVApplyToTableViewImplementationSynthesize(className, ...) \
    AVArrayModelCategoryInterfaceSynthesize(className); \
    AVArrayModelCategoryImplementationSynthesize(className, __VA_ARGS__);

AVArrayModelCategoryImplementationSynthesize(AVArrayChangesObject, {
    [tableView updateWithChangesBlock:^{
        return;
    }];
});

AVApplyToTableViewImplementationSynthesize(AVArrayOneIndexChangesObject, {
    id paths = @[[NSIndexPath indexPathForRow:self.index inSection:0]]; \
    [tableView updateWithChangesBlock:^{
        switch (self.changesType) {
            AVSwitchCase(AVArrayModelChangeDidDeleteObject, { [tableView deleteRowsAtIndexPaths:paths
                                                                               withRowAnimation:animation]; });
            AVSwitchCase(AVArrayModelChangeDidInsertObject, { [tableView insertRowsAtIndexPaths:paths
                                                                               withRowAnimation:animation]; });
            AVSwitchCaseDefault({ return; });
        }
    }];
});

AVApplyToTableViewImplementationSynthesize(AVArrayTwoIndexesChangesObject, {
    [tableView updateWithChangesBlock:^{
        switch (self.changesType) {
            AVSwitchCase(AVArrayModelChangeDidMoveObject,
                         { [tableView moveRowAtIndexPath:[NSIndexPath indexPathForRow:self.index inSection:0]
                                             toIndexPath:[NSIndexPath indexPathForRow:self.targetIndex inSection:0]]; });
            AVSwitchCaseDefault({ return; });
        }
    }];
});
