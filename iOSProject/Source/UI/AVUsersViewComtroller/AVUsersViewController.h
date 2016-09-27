//
//  AVUsersViewController.h
//  iOSProject
//
//  Created by Aleksandr Voropaev on 9/2/16.
//  Copyright © 2016 Aleksandr Voropaev. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "AVArrayModel.h"

@class AVUsers;

@interface AVUsersViewController : UIViewController <UITableViewDataSource, UITableViewDelegate, AVArrayModelObserver>
@property (nonatomic, strong) AVUsers   *users;

@end
