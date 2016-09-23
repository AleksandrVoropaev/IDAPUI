//
//  usersView.h
//  iOSProject
//
//  Created by Aleksandr Voropaev on 9/2/16.
//  Copyright © 2016 Aleksandr Voropaev. All rights reserved.
//

#import <UIKit/UIKit.h>

@class AVUser;

typedef enum : NSUInteger {
    AVButtonsHiddenTypeAllHidden,
    AVButtonsHiddenTypeAllVisible,
    AVButtonsHiddenTypeEditVisible,
    AVButtonsHiddenTypeSortVisible,
    AVButtonsHiddenTypeCreateVisible,
    AVButtonsHiddenTypeEditHidden,
    AVButtonsHiddenTypeSortHidden,
    AVButtonsHiddenTypeCreateHidden,
} AVButtonsHiddenType;

@protocol AVArrayModelObserver <NSObject>

@optional
- (void)AVArrayStateDidDeleteObjectAtIndex:(NSIndexPath *)index;
- (void)AVArrayStateDidCreateObject:(id)object;
- (void)AVArrayStateDidInsertObject:(id)object atIndex:(NSIndexPath *)index;

@end

@interface AVUsersView : UIView <AVArrayModelObserver>
@property (nonatomic, strong)   IBOutlet UITableView    *tableView;
@property (nonatomic, strong)   IBOutlet UIButton       *editButton;
@property (nonatomic, strong)   IBOutlet UIButton       *sortButton;
@property (nonatomic, strong)   IBOutlet UIButton       *createButton;

- (void)changeButtonsVisibilityWithType:(AVButtonsHiddenType)type;

@end
