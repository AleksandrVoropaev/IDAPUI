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

@protocol AVArrayModelObserver <NSObject>

@optional
- (void)arrayStateDidDeleteObjectAtIndex:(NSIndexPath *)index;
- (void)arrayStateDidCreateObject:(id)object;
- (void)arrayStateDidInsertObject:(id)object atIndex:(NSIndexPath *)index;

@end

@interface AVUsersViewController : UIViewController <UITableViewDataSource, UITableViewDelegate, AVArrayModelObserver>
@property (nonatomic, strong) AVUsers   *users;

@end
