//
//  usersView.h
//  iOSProject
//
//  Created by Aleksandr Voropaev on 9/2/16.
//  Copyright © 2016 Aleksandr Voropaev. All rights reserved.
//

#import <UIKit/UIKit.h>

@class AVUser;

//typedef enum : NSUInteger {
//    AVButtonsHiddenTypeAllHidden,
//    AVButtonsHiddenTypeAllVisible,
//    AVButtonsHiddenTypeEditVisible,
//    AVButtonsHiddenTypeSortVisible,
//    AVButtonsHiddenTypeCreateVisible,
//    AVButtonsHiddenTypeEditHidden,
//    AVButtonsHiddenTypeSortHidden,
//    AVButtonsHiddenTypeCreateHidden,
//} AVButtonsHiddenType;


@interface AVUsersView : UIView
@property (nonatomic, strong)   IBOutlet UITableView    *tableView;
@property (nonatomic, strong)   IBOutlet UIButton       *editButton;
@property (nonatomic, strong)   IBOutlet UIButton       *sortButton;
@property (nonatomic, strong)   IBOutlet UIButton       *createButton;

@property (nonatomic, assign)   BOOL    sorting;
//- (void)changeButtonsVisibilityWithType:(AVButtonsHiddenType)type;

@end
