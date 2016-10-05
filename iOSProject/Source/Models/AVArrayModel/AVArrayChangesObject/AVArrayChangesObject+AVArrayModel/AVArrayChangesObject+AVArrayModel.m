//
//  AVArrayChangesObject+AVArrayModel.m
//  iOSProject
//
//  Created by Aleksandr Voropaev on 10/4/16.
//  Copyright © 2016 Aleksandr Voropaev. All rights reserved.
//

#define AVImplementationSynthesize(className, ...) \
    @interface className (AVArrayModel) \
    @end \
    @implementation className (AVArrayModel) \
    - (void)applyToModel:(AVArrayModel *)model { \
        id object = self.object; \
        NSUInteger index = self.index; \
        switch (self.changesType) { \
                __VA_ARGS__ \
                AVSwitchCaseDefault({ return; }); \
        } \
    } \
    @end

#import "AVArrayChangesObject+AVArrayModel.h"

#import "AVArrayOneIndexChangesObject.h"
#import "AVArrayTwoIndexesChangesObject.h"

#import "AVSwitchCaseMacro.h"

@implementation AVArrayChangesObject (AVArrayModel)

- (void)applyToModel:(AVArrayModel *)model {
    return;
}

@end

AVImplementationSynthesize(AVArrayOneIndexChangesObject,
                           AVSwitchCase(AVArrayModelChangeDidDeleteObject,
                                        { [model removeObject:object]; });
                           AVSwitchCase(AVArrayModelChangeDidInsertObject,
                                        { [model insertObject:object atIndex:index]; }););

AVImplementationSynthesize(AVArrayTwoIndexesChangesObject,
                           AVSwitchCase(AVArrayModelChangeDidMoveObject,
                                        { [model moveObjectFromIndex:index toIndex:self.targetIndex]; }););
