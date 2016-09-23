//
//  usersView.m
//  iOSProject
//
//  Created by Aleksandr Voropaev on 9/2/16.
//  Copyright © 2016 Aleksandr Voropaev. All rights reserved.
//

#import "AVUsersView.h"

#import "AVSwitchCaseMacro.h"

@interface AVUsersView ()

@end

@implementation AVUsersView

NSComparisonResult(^AVComparisonBlock)(NSString *firstSurname, NSString *secondSurname);

- (void)changeButtonsVisibilityWithType:(AVButtonsHiddenType)type {
    void(^AVButtonsVisibilityChangeBlock)(BOOL editButtonHidden, BOOL sortButtonHidden, BOOL createButtonHidden) = ^(BOOL editButtonHidden, BOOL sortButtonHidden, BOOL createButtonHidden) {
        self.editButton.hidden = editButtonHidden;
        self.sortButton.hidden = sortButtonHidden;
        self.createButton.hidden = createButtonHidden;
    };
    
    switch (type) {
        AVSwitchCase(AVButtonsHiddenTypeAllHidden,      { AVButtonsVisibilityChangeBlock(YES, YES, YES); });
        AVSwitchCase(AVButtonsHiddenTypeAllVisible,     { AVButtonsVisibilityChangeBlock(NO, NO, NO); });
        AVSwitchCase(AVButtonsHiddenTypeEditVisible,    { AVButtonsVisibilityChangeBlock(NO, YES, YES); });
        AVSwitchCase(AVButtonsHiddenTypeSortVisible,    { AVButtonsVisibilityChangeBlock(YES, NO, YES); });
        AVSwitchCase(AVButtonsHiddenTypeCreateVisible,  { AVButtonsVisibilityChangeBlock(YES, YES, NO); });
        AVSwitchCase(AVButtonsHiddenTypeEditHidden,     { AVButtonsVisibilityChangeBlock(YES, NO, NO); });
        AVSwitchCase(AVButtonsHiddenTypeSortHidden,     { AVButtonsVisibilityChangeBlock(NO, YES, NO); });
        AVSwitchCase(AVButtonsHiddenTypeCreateHidden,   { AVButtonsVisibilityChangeBlock(NO, NO, YES); });
        AVSwitchCaseDefault({ });
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
