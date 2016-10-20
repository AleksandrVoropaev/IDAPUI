//
//  AVUsers.h
//  iOSProject
//
//  Created by Aleksandr Voropaev on 9/12/16.
//  Copyright © 2016 Aleksandr Voropaev. All rights reserved.
//

//#import <UIKit/UIKit.h>

#import "AVArrayModel.h"

@interface AVUsers : AVArrayModel //<UIApplicationDelegate>

+ (instancetype)users;

- (void)addUsers:(NSArray *)users;

- (void)addObservationWithNotificationNames:(NSArray *)notificationNames;
- (void)removeObservationWithNotificationNames:(NSArray *)notificationNames;

@end
