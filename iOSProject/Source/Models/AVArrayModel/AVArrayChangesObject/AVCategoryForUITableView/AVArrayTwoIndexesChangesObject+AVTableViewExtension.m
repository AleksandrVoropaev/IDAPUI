//
//  AVArrayTwoIndexesChangesObject+AVTableViewExtension.m
//  iOSProject
//
//  Created by Aleksandr Voropaev on 9/30/16.
//  Copyright © 2016 Aleksandr Voropaev. All rights reserved.
//

#import "AVArrayTwoIndexesChangesObject+AVTableViewExtension.h"

@implementation AVArrayTwoIndexesChangesObject (AVTableViewExtension)

- (void)applyToTableView:(UITableView *)tableView {
    if (self.changesType == AVArrayModelChangeDidMoveObject) {
        [tableView moveRowAtIndexPath:[NSIndexPath indexPathForRow:self.index inSection:0]
                          toIndexPath:[NSIndexPath indexPathForRow:self.targetIndex inSection:0]];
    }
}

@end
