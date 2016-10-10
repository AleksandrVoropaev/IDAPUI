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

#define AVArrayModelCategoryInterfaceSynthesize(className) \
    @interface className (AVArrayModel) \
    @end \

#define AVArrayModelCategoryImplementationSynthesize(className, ...) \
    @implementation className (AVArrayModel) \
    - (void)applyToModel:(AVArrayModel *)model { \
        __VA_ARGS__ \
    } \
    @end

#define AVApplyToModelImplementationSynthesize(className, ...) \
    AVArrayModelCategoryInterfaceSynthesize(className); \
    AVArrayModelCategoryImplementationSynthesize(className, __VA_ARGS__);

AVArrayModelCategoryImplementationSynthesize(AVArrayChangesObject, {
    return;
});

AVApplyToModelImplementationSynthesize(AVArrayOneIndexChangesObject, {
    id object = self.object;
    NSUInteger index = self.index;
    switch (self.changesType) {
        AVSwitchCase(AVArrayModelChangeDidDeleteObject, { [model removeObject:object]; });
        AVSwitchCase(AVArrayModelChangeDidInsertObject, { [model insertObject:object atIndex:index]; });
        AVSwitchCaseDefault({ return; });
    }
});
    

AVApplyToModelImplementationSynthesize(AVArrayTwoIndexesChangesObject, {
    NSUInteger index = self.index;
    NSUInteger targetIndex = self.targetIndex;
    switch (self.changesType) {
        AVSwitchCase(AVArrayModelChangeDidMoveObject, { [model moveObjectFromIndex:index toIndex:targetIndex]; });
        AVSwitchCaseDefault({ return; });
    }
});
