//
//  usersView.m
//  iOSProject
//
//  Created by Aleksandr Voropaev on 9/2/16.
//  Copyright © 2016 Aleksandr Voropaev. All rights reserved.
//

#import "AVUsersView.h"

#import "AVUser.h"
#import "AVArrayModel.h"

#import "AVSwitchCaseMacro.h"

@interface AVUsersView ()

@end

@implementation AVUsersView

- (void)setSorting:(BOOL)sorting {
    if (_sorting != sorting) {
        _sorting = sorting;
        
        self.editButton.hidden = sorting;
        self.createButton.hidden = sorting;
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
