//
//  AVArrayChangesObject+AVArrayModel.m
//  iOSProject
//
//  Created by Aleksandr Voropaev on 10/4/16.
//  Copyright © 2016 Aleksandr Voropaev. All rights reserved.
//

#import "AVArrayChangesObject+AVArrayModel.h"

#import "AVArrayOneIndexChangesObject.h"
#import "AVArrayTwoIndexesChangesObject.h"

#import "AVSwitchCaseMacro.h"

@interface AVArrayOneIndexChangesObject (AVArrayModel)

@end

@interface AVArrayTwoIndexesChangesObject (AVArrayModel)

@end

@implementation AVArrayChangesObject (AVArrayModel)

- (void)applyToModel:(AVArrayModel *)model {
    return;
}

@end

@implementation AVArrayOneIndexChangesObject (AVArrayModel)

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

@implementation AVArrayTwoIndexesChangesObject (AVArrayModel)

- (void)applyToModel:(AVArrayModel *)model {
    NSUInteger index = self.index;
    NSUInteger targetIndex = self.targetIndex;
    switch (self.changesType) {
        AVSwitchCase(AVArrayModelChangeDidMoveObject, { [model moveObjectFromIndex:index toIndex:targetIndex]; });
        AVSwitchCaseDefault({ return; });
    }
}

@end
