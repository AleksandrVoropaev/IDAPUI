//
//  AVUsersViewController.h
//  iOSProject
//
//  Created by Aleksandr Voropaev on 9/2/16.
//  Copyright © 2016 Aleksandr Voropaev. All rights reserved.
//

#import <UIKit/UIKit.h>

@class AVUsers;
@class AVSortingArrayModel;

@interface AVUsersViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, strong) AVUsers               *users;
@property (nonatomic, strong) AVSortingArrayModel   *sortedUsers;

//+ (instancetype)usersViewControllerWithModel:(AVUsers *)model;

@end
