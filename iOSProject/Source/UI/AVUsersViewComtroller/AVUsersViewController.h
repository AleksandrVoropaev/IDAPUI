//
//  AVUsersViewController.h
//  iOSProject
//
//  Created by Aleksandr Voropaev on 9/2/16.
//  Copyright © 2016 Aleksandr Voropaev. All rights reserved.
//

#import <UIKit/UIKit.h>

@class AVUser;

@interface AVUsersViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, strong) AVUser    *user;
@end
